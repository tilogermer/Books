class AboutController < ApplicationController

	def index
		@books = Book.where(:isReturned => false).order("return_date ASC")
		@books1 = Book.where(:isFavorite => true).order("return_date DESC").group(:reader_id)
		@return_date_min = Book.where(:isReturned => false).minimum(:return_date)
		@readers = Reader.all
	end
end
