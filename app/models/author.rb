# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  fname       :string
#  lname       :string
#  category_id :integer
#  country_id  :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  authorpath  :string
#

class Author < ApplicationRecord
	belongs_to :country
	belongs_to :category
	has_many :books
end
