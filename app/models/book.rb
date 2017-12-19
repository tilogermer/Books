# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string
#  category_id :integer
#  author_id   :integer
#  library_id  :integer
#  year        :string
#  price       :float
#  isFavorite  :boolean
#  isNew       :boolean
#  isReturned  :boolean
#  return_date :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  coverpath   :string
#  medium_id   :integer
#  user_id     :integer
#  reader_id   :integer
#  date_start  :date
#  tag_id      :integer
#  slug        :string
#

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

    mount_uploader :image, ImageUploader

	scope :sorted, -> {order(return_date: :asc)}	
	scope :sorted_des, -> {order(return_date: :desc)}
	scope :pending, -> {where(isReturned: false)}

	
	self.per_page = 24
	
	def to_s
		title
	end
	
end
