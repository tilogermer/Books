# == Schema Information
#
# Table name: media
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Medium < ApplicationRecord
	has_many :books

	extend FriendlyId
    friendly_id :name, use: :slugged

	def to_s
		name
	end
end
