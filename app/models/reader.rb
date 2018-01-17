# == Schema Information
#
# Table name: readers
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  readerpath  :string
#  description :text
#

class Reader < ApplicationRecord
	has_many :books
	has_many :loans, dependent: :destroy

	extend FriendlyId
    friendly_id :name, use: :slugged
    
    mount_uploader :image, ImageUploader
    
	def to_s
		name
	end
end
