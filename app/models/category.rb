# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
	has_many :books

	extend FriendlyId
    friendly_id :name, use: :slugged

	def to_s
		name
	end
end
