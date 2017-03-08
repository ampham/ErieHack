class ApiLocationsController < ApplicationController

	def index
		render json: Location.all
	end

end
