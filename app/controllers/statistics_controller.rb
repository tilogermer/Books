class StatisticsController < ApplicationController
	def index
		@books = Book.all
		@categories = Category.all
		@category = Category.new
		@reader = Reader.new
		@readers = Reader.all
		
	end
end
