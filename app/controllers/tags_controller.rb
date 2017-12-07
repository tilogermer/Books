class TagsController < ApplicationController
before_action :find_tag, only: [:show, :edit, :update, :destroy]
 
  def index
    @page_title = 'Tags'
    @tags = Tag.all.order("name ASC")
  end

  def new
    @page_title = 'Add tag'
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag created"
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @tag.update(tag_params)
    
      flash[:notice] = "Tag updated"
    
      redirect_to tags_path
  
  end

  def show
    @tags = Tag.all
    @books = @tag.books
  end

  def destroy
    @tag.destroy
    flash[:notice] = "Tag removed"
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :image, :description)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
end
