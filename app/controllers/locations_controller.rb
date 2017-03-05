class LocationsController < ApplicationController

	def index
		@locations = Location.all
	end

	def show
		@location = Location.find(params[:id])
	end

	def new 
		@location = Location.new
	end

	def create
		@location = Location.new(allowed_params)

		if @location.save
			flash[:success] = "Created new post"
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
