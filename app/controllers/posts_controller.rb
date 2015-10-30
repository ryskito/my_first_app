class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :edit_post, only: [:edit, :destroy]

  def index
     # for index
     @posts = Post.order("created_at DESC").page params[:page]
     if params[:user_id] || params[:category_id] || params[:keyword]
     # 検索フォームにいずれかが入力されたら検索結果ページ表示するようにする
       @posts = Post.search_user(params[:user_id])
                    .search_category(params[:category_id])
                    .search_keyword(params[:keyword])
                    .order("created_at DESC")
                    .page params[:page]
     end
  end

  def show
  end

  def new
    @post = Post.new
    @post.user_id = current_user
  end

  def create
    @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.save
      redirect_to @post
  end

  def edit
  end

  def update
    if @post.created_by?(current_user)
      @post.update(post_params)
      redirect_to post_path
    else
      redirect_to posts_path
    end
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to posts_path
    end
  end


  private

    def post_params
      params.require(:post).permit(:title, :content, :category_id, :picture)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def edit_post
      if @post.user_id == current_user.id
      else
        redirect_to posts_path
      end
    end

    def search_params
      params.permit(:keyword)
    end

end
