class MediaController < ApplicationController
  before_action :find_medium, only: [:show, :edit, :update, :destroy]
  
  def index
    @page_title = 'Media'
    @media = Medium.all.order("name ASC")
  end

  def new
    @page_title = 'Add medium'
    @medium = Medium.new
  end

  def create
    @medium = Medium.new(medium_params)
    if @medium.save
      flash[:info] = "Medium Created"
      redirect_to media_path
    else
      render 'new'
    end
  end

  def show
    @media = Media.all
    @books = @media.books
  end

  def edit
  end

  def update
    @medium.update(medium_params)
    flash[:info] = 'Medium updated'
    redirect_to media_path
  end

  def destroy
    @medium.destroy
    flash[:danger] = "Medium removed"
    redirect_to media_path
  end

  private 
  def medium_params
    params.require(:medium).permit(:name)
  end

  def find_medium
    @medium = Medium.friendly.find(params[:id])
  end

end
