class AboutController < ApplicationController

	def index
		@books = Book.where(:isReturned => false).order("return_date ASC")
		@books3 = Book.where(:isReturned => false).minimum(:return_date)

		@books1 = Book.where(:isFavorite => true)
		@books2 = Book.where(:isReturned => false, :library_id =>2).order("return_date ASC")
		

		@categories = Category.all
		@category = Category.new
		@libraries = Library.all
		@readers = Reader.all
		
		
		
	end
end
