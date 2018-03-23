class AboutController < ApplicationController

	def index
		@page_title = 'About'
		@books = Book.pending.sorted
		@loans = Loan.available
		@return_date_min = Loan.available.minimum(:date_end)
		@books1 = Book.where(:isFavorite => true).order("return_date DESC").group(:reader_id)
		
		@books2 = Book.books_top.shuffle[0..3]
		@books3 = Book.books_new.order(created_at: :desc).limit(4)
		
		@authors = Author.all
		@authors1 = @authors.select {|author| author.books.count >= 3}.shuffle[0..3]
		@readers = Reader.all
	end
end
