class Status < ApplicationRecord
	belongs_to :location
	belongs_to :user

	# return the user who created this status
	def my_user(user_id)
		return User.find_by_id(user_id)
	end

end
