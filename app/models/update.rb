class Update < ApplicationRecord
	belongs_to :location
	belongs_to :user

	# create a new Update from an incoming text message
	def self.create_from_text(lead, merc, plut)
		Update.create(lead: lead,
			mercury: merc,
			plutonium: plut,
			location_id: 1,
			user_id: 1
			)
	end

	# return a list of all Locations in the database
	def self.get_locations
		locations = Location.select(:title).distinct
		@locations_list = []
		locations.each do |loc|
			@locations_list << loc.title
		end
		return @locations_list
	end

	# return the user who created this update
	def my_user(user_id)
		return User.find_by_id(user_id)
	end
	
end
