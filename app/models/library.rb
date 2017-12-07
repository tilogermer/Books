class Library < ApplicationRecord
	has_many :books
	
	mount_uploader :image, ImageUploader

	def to_s
		name
	end
end
