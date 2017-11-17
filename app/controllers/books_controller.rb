class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
    @page_title = 'Overlook'

  if params[:category].blank? && params[:library].blank?
    @books = Book.where(:isReturned => false).order("return_date ASC")
    
    elsif params[:library].blank?
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(:category_id => @category_id).order("return_date ASC")
    
    else
      @library_id = Library.find_by(name: params[:library]).id
      @books = Book.where(:library_id => @library_id, :isReturned => false).order("return_date ASC")
    end
      
  end
   
  def booklist
    @books = Book.where(:isReturned => false).order("return_date ASC")
    @categories = Category.all
    @readers = Reader.all
    
  end

  def booklist_all
    @books = Book.all.order("title ASC")
    @categories = Category.all
  end
  
  def new_books
    @books = Book.where(:isNew => true).order("created_at ASC")
  end

  def new
    @page_title = 'Add book'
    @book = current_user.books.build
    @categories = Category.all.map{|c| [c.name, c.id]}
    @libraries = Library.all.map{|l| [l.name, l.id]}
    @media = Medium.all.map{|m| [m.name, m.id]}
    @authors = Author.all.map{|a| [a.lname, a.id]}
    @readers = Reader.all.map{|r| [r.name, r.id]}
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
    @categories = Category.all
    @authors = Author.all
    @author = @book.author
    @media = Medium.all
    @readers = Reader.all
    @days = @book.return_date - @book.date_start

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
  params.require(:book).permit(:title, :description, :author_id, :category_id, :medium_id, :reader_id, :book_img,
   :date_start, :return_date, :library_id, :isReturned, :price, :year, :isFavorite, :isNew, :coverpath)
end

def find_book
  @book = Book.find(params[:id])
end

end
