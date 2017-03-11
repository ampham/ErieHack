class ApiLocationsController < ApplicationController

	def index
		@locations = Location.all
		render json: @locations
	end

	def show
		location = Location.find(params[:id])
		updates = location.updates.to_json
		render :json => location, :include => :statuses
	end

	# temporary endpoint for demonstration only
	def current
		this_one = Status.last
		render :json => this_one
	end
	
end
