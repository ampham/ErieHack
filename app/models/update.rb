class Update < ApplicationRecord
	belongs_to :location
	belongs_to :user

	def self.get_locations
		locations = Location.select(:id).distinct
		@locations_list = []
		locations.each do |loc|
			@locations_list << loc.id
		end
		return @locations_list
	end
end
