class AboutController < ApplicationController

	def index
		@books = Book.where(:isReturned => false).order("return_date ASC")
		@books3 = Book.where(:isReturned => false).minimum(:return_date)

		@books1 = Book.where(:isFavorite => true)
		@books2 = Book.where(:isReturned => false, :library_id =>2)
		@books4 = Book.where(:isReturned => false, :library_id =>1)
		@books6 = Book.where(:isReturned => false, :library_id =>2).minimum(:return_date)
		@books5 = Book.where(:isReturned => false, :library_id =>1).minimum(:return_date)


    
  
		

		@categories = Category.all
		@category = Category.new
		@libraries = Library.all
		@readers = Reader.all
		@reviews = Review.all
		
		
	end
end
