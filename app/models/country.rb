class Country < ApplicationRecord
	has_many :authors

	def to_s
		name
	end
end
