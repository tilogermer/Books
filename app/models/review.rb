# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  rating     :integer
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  book_id    :integer
#

class Review < ApplicationRecord
	belongs_to :user
	belongs_to :book

	

end
