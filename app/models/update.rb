class Update < ApplicationRecord
	belongs_to :location
	belongs_to :user

	# return a list of all Locations in the database
	def self.get_locations
		locations = Location.select(:id).distinct
		@locations_list = []
		locations.each do |loc|
			@locations_list << loc.id
		end
		return @locations_list
	end

	# return the user who created this update
	def my_user(user_id)
		return User.find_by_id(user_id)
	end
end
