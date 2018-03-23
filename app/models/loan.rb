class Loan < ApplicationRecord
	
	belongs_to :library
	belongs_to :reader
	belongs_to :book
	
	scope :sorted, -> {order(date_end: :asc)}	
	scope :sorted_desc, -> {order(date_end: :desc)}
	scope :available, -> {where(is_returned: false)}

	self.per_page = 24
	
end
