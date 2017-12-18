# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  image       :string
#

class Tag < ApplicationRecord
	has_many :books

	mount_uploader :image, ImageUploader

	def to_s
		name
	end
end
