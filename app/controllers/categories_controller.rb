class CategoriesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_category, only: [:edit, :update]


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to new_post_path
  end


  private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end

end
