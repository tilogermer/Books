class Book < ApplicationRecord
	belongs_to :category, optional: true
	belongs_to :reader, optional: true
	belongs_to :author, optional: true
	belongs_to :medium, optional: true
	belongs_to :library
	belongs_to :user
	has_many :reviews
	belongs_to :tag, optional: true

	scope :sorted, -> {order(return_date: :asc)}	
	scope :sorted_des, -> {order(return_date: :desc)}
	scope :pending, -> {where(isReturned: false)}

	

	def to_s
		title
	end
	
end
