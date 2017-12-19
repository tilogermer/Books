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

	extend FriendlyId
    friendly_id :name, use: :slugged
    
	def to_s
		name
	end
end
