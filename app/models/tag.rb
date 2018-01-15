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
	has_many :taggings
	has_many :books, through: :taggings

	mount_uploader :image, ImageUploader

	def to_s
		name
	end

	def self.counts
      self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
    end
    
end
