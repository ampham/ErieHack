class LocationsController < ApplicationController

	def index
		@locations = Location.all
	end

	def show
		@location = Location.find(params[:id])
		@updates = @location.updates.all.order('created_at DESC')
		@statuses = @location.statuses.all.order('created_at DESC')
	end

	def new 
		@location = Location.new
	end

	def create
		@location = Location.new(allowed_params)

		if @location.save
			flash[:success] = "Created new location"
			redirect_to @location
		else
			render 'new'
		end
	end

	private

		def allowed_params
			params.require(:location).permit(:title, :description)
		end
end
