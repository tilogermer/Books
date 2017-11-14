class AboutController < ApplicationController

	def index
		@books = Book.where(:isReturned => false).order("return_date ASC")
		@categories = Category.all
		@category = Category.new
		@libraries = Library.all
		@readers = Reader.all
		
		
		
	end
end
