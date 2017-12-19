class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @page_title = 'Categories'
    @categories = Category.all.order("name ASC")
  end

  def new
    @page_title = 'Add category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Created"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    @categories = Category.all
    @books = @category.books
  end

  def edit
  end

  def update
     @category.update(category_params)
     flash[:notice] = "Category updated"
     redirect_to categories_path
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category removed"
    redirect_to categories_path
  end

  
  private 
  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
  @category = Category.friendly.find(params[:id])
  end


end
