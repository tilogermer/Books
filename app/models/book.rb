class Book < ApplicationRecord
	belongs_to :category, optional: true
	belongs_to :reader, optional: true
	belongs_to :author, optional: true
	belongs_to :medium, optional: true
	belongs_to :library
	belongs_to :user
	has_many :reviews
	belongs_to :tag, optional: true

	extend FriendlyId
    friendly_id :title, use: :slugged

	scope :sorted, -> {order(return_date: :asc)}	
	scope :sorted_des, -> {order(return_date: :desc)}
	scope :pending, -> {where(isReturned: false)}

	
	self.per_page = 24
	
	def to_s
		title
	end
	
end
