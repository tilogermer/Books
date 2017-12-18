# == Schema Information
#
# Table name: libraries
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  description :text
#

class Library < ApplicationRecord
	has_many :books
	
	mount_uploader :image, ImageUploader

	def to_s
		name
	end
end
