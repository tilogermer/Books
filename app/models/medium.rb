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

	def to_s
		name
	end
end
