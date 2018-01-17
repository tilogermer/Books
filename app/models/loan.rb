class Loan < ApplicationRecord
	belongs_to :book
	belongs_to :library
	belongs_to :reader
end
