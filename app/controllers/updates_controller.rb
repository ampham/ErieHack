class UpdatesController < ApplicationController

	def new
		@update = Update.new

		# make locations IDs available to select in the form
		locations = Location.select(:id).distinct
		@locations_list = []
		locations.each do |loc|
			@locations_list << loc.id
		end
	end

	def create
		@update = Update.new(allowed_params)

		if @update.save
			flash[:success] = "Created new update"
			redirect_to @update
		else
			render 'new'
		end
	end

	def show
		@update = Update.find(params[:id])
	end


	private

		def allowed_params
			params.require(:update).permit(:lead, :mercury, :plutonium, :location_id)
		end

end
