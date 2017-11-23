class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
    @page_title = 'Overlook'
    @tags = Tag.all
    @return_date_min = Book.where(:isReturned => false).minimum(:return_date)

  if params[:category].blank? && params[:library].blank? && params[:tag].blank?
    @books = Book.where(:isReturned => false).order("return_date ASC")
      @page_title = 'Overlook'

    elsif params[:library].blank? && params[:tag].blank?
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(:category_id => @category_id).order("return_date ASC")
      @page_title = 'Categories'

    elsif params[:library].blank? && params[:category].blank?
      @tag_id = Tag.find_by(name: params[:tag]).id
      @books = Book.where(:tag_id => @tag_id).order("return_date ASC")
      @page_title = 'Tags'

    else
      @library_id = Library.find_by(name: params[:library]).id
      @books = Book.where(:library_id => @library_id, :isReturned => false).order("return_date ASC")
      @page_title = 'Libraries'
    end
      
  end
   
  def booklist
    @books = Book.where(:isReturned => false).order("return_date ASC")
    @categories = Category.all
    @readers = Reader.all
    @page_title = 'Book list'
  end

  def booklist_all
    @books = Book.all.order("title ASC")
    @categories = Category.all
  end
  
  def new_books
    @books = Book.where(:isNew => true).order("created_at ASC")
    @page_title = 'new'
  end

  def new
    @page_title = 'Add book'
    @book = current_user.books.build
    
  end

  def create
    @book = current_user.books.build(book_params)
    
    if @book.save
       redirect_to books_path
    else
      render 'new'
    end
  end

  def show
    
    @authors = Author.all
    @author = @book.author
    @tags = Tag.all
    @tag = @book.tag
    
    if @book.reviews.blank?
    @average_review = 0
  else
    @average_review = @book.reviews.average(:rating).round(2)
  end
    
  end

  

  def edit
  end

  def update
    @book.update(book_params)
    flash[:notice] = 'Book updated'
    redirect_to books_path
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
def book_params
  params.require(:book).permit(:title, :description, :author_id, :category_id, :tag_id, :medium_id, :reader_id,
   :date_start, :return_date, :library_id, :isReturned, :price, :year, :isFavorite, :isNew, :coverpath)
end

def find_book
  @book = Book.find(params[:id])
end

end
