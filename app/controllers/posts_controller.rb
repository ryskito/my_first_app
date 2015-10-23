class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    # @posts = Post.search(params[:search])
    # if params[:search]
    #   @posts = Post.where(['title LIKE ?', "%#{params[:search]}%"]).order("created_at DESC").page params[:page]
    # else
    #    # for index
      @posts = Post.order("created_at DESC").page params[:page]
    # end

  end

  # def find
  #
  # end

  def show
    @user = current_user
    # @user = User.find(params[:id])
    # @posts = Post.where(user_id: @user.id)

    # if @post.category
    #   @category_name = @post.category.name
    # end
  end

  def new
    @user = current_user
    @post = Post.new
  end

  # def create
  #   @post = Post.new(post_params)
  #   if @post.save
  #     redirect_to posts_path
  #   else
  #     render 'new'
  #   end
  # end

  def create
    @post = Post.new(post_params)
    @user = current_user
    # @post.user_id = @user.name
    if @post.save
      redirect_to posts_path
    else
      render 'new'
      # redirect_to @post, error: "You don't have permission."
    end
    # respond_to do |format|
    #   format.html { redirect_to posts_path }
    #   format.json { head :no_content }
    # end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

    def post_params
      params.require(:post).permit(:title, :content, :category_id, :picture, :user_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def search_params
      params.permit(:keyword)
    end



end
