class StatisticsController < ApplicationController
	def index
		@page_title = 'Statistics'
		@books = Book.all
		@categories = Category.all
		@category = Category.new
		@reader = Reader.new
		@readers = Reader.all
		
	end

	def authors_by_country
		result = {}
		Country.all.map do |c|
			result[c.name] = c.authors.count 
		end
		render json:[{name: 'Counter', data: result}]
	end
end
