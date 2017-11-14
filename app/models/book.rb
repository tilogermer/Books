class Book < ApplicationRecord
	belongs_to :category
	belongs_to :reader
	belongs_to :author
	belongs_to :medium
	belongs_to :library
	belongs_to :user
	has_many :reviews

	def to_s
		title
	end
	
end
