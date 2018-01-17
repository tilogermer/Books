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
	has_many :loans, dependent: :destroy
	
	mount_uploader :image, ImageUploader

	extend FriendlyId
    friendly_id :name, use: :slugged
    
	def to_s
		name
	end
end
