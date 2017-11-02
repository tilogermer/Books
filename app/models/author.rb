class Author < ApplicationRecord
	belongs_to :country
	belongs_to :category
	has_many :books
end
