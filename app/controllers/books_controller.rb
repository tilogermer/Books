class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
    
    @tags = Tag.all
    @return_date_min = Book.pending.minimum(:return_date)

  if params[:library]
      @library_id = Library.find_by(name: params[:library]).id
      @books = Book.where(library_id: @library_id, isReturned: false).page(params[:page]).sorted
      @page_title = 'Libraries'

    elsif params[:category]
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(category_id: @category_id).page(params[:page]).sorted_des
      @page_title = 'Categories'

    elsif params[:tag]
      @tag_id = Tag.find_by(name: params[:tag]).id
      @books = Book.tagged_with(params[:tag]).page(params[:page]).sorted_des
      @page_title = 'Tags'

    elsif params[:reader]
      @reader_id = Reader.find_by(name: params[:reader]).id
      @books = Book.where(reader_id: @reader_id, isReturned: false).page(params[:page]).sorted_des
      @page_title = 'Readers' 

    elsif params[:search]
      @books = Book.search(params[:search]).page(params[:page]).order("title ASC")

    else
      @books = Book.pending.page(params[:page]).sorted
      @page_title = 'Overlook'
    end
  end
   
  def booklist
    @books = Book.pending.sorted
    @categories = Category.all
    @readers = Reader.all
    @page_title = 'Book list'
  end

  def booklist_all
    @books = Book.all.order("title ASC")
    @categories = Category.all
  end
  
  def new_books
    @books = Book.where(isNew: true).order("created_at ASC")

    @page_title = 'new'
  end

  def new
    @page_title = 'Add book'
    @book = current_user.books.build
    @book.loans.build
    
  end

  def create
    @book = current_user.books.build(book_params)
    
    if @book.save
      flash[:info] = "Book created"
       redirect_to books_path
    else
      render 'new'
    end
  end

  def show
    
    #@authors = Author.all
    @author = @book.author
    @tags = @book.tags
    @page_title = @book.title
    
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
    flash[:info] = 'Book updated'
    redirect_to books_path
  end

  def destroy
    @book.destroy
    flash[:danger] = "Book removed"
    redirect_to books_path
  end

  private
def book_params
  params.require(:book).permit(:title, :description, :author_id,  :category_id, :tag_id, :medium_id, :reader_id,
   :date_start, :return_date, :library_id, :isReturned, :price, :year,
   :isFavorite, :isNew, :image, :coverpath, :all_tags,
   loans_attributes: [:id, :date_start, :date_end, :library_id, :book_id, :reader_id, :is_returned, :_destroy])
end

def find_book
  @book = Book.friendly.find(params[:id])
end

end
