class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update, :destroy]
  
  def index
    @authors = Author.all.order("lname ASC")
  end

  def new
    @author = Author.new
    @category = Category.new
    @country = Country.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author created"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def show
     @authors = Author.all
     @books = @author.books
     @categories = Category.all
     @countries = Country.all
  end

  def edit
  end

  def update
    @author.update(author_params)
    flash[:notice] = "Author udpated"
    redirect_to authors_path
  end

  def destroy
    @author.destroy
    flash[:notice] = "Author removed"
    redirect_to authors_path
  end

  private
  def author_params
    params.require(:author).permit(:fname, :lname, :country_id, :category_id, :description, :authorpath)
  end

  def find_author
  @author = Author.find(params[:id])
end
end
