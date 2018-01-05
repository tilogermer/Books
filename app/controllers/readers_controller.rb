class ReadersController < ApplicationController
  before_action :find_reader, only: [:show, :edit, :update, :destroy]

  def index
    @page_title = 'Readers'
    @readers = Reader.all.order("name ASC")
  end

  def new
    @page_title = 'Add reader'
    @reader = Reader.new
  end

  def create
    @reader = Reader.new(reader_params)
    if @reader.save
      flash[:notice] = "Reader Created"
      redirect_to readers_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @readers = Reader.all
    @books = @reader.books.page(params[:page]).order("return_date DESC")
    
  end

  def update
    @reader.update(reader_params)
    flash[:notice] = "Reader updated"
    redirect_to readers_path
  end

  def destroy
    @reader.destroy
    flash[:notice] = "Reader removed"
    redirect_to readers_path
  end

  private

  def reader_params
    params.require(:reader).permit(:name, :readerpath, :image, :description)
  end

  def find_reader
    @reader = Reader.friendly.find(params[:id])
  end

end
