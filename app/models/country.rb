# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ApplicationRecord
	has_many :authors

	mount_uploader :image, ImageUploader
	
	extend FriendlyId
    friendly_id :name, use: :slugged

	def to_s
		name
	end
end
