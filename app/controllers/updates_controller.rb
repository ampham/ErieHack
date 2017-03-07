class UpdatesController < ApplicationController

	def new
		@update = Update.new
		#@update.user_id = current_user.id

		# make locations IDs available to select in the form
		@locations_list = Update.get_locations
	end

	def create
		# same as in new
		@locations_list = Update.get_locations

		@user = current_user
		@update = Update.new(allowed_params)
		@update.user_id = current_user.id

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
			params.require(:update).permit(:lead, :mercury, :plutonium, :location_id, :user_id)
		end

end
