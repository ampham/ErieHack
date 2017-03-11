class UpdatesController < ApplicationController

	# This is just for demonstrating how an SMS POST would work
	def index
		@updates = Update.all.order('created_at DESC')
	end

	def new
		@update = Update.new
		#@update.user_id = current_user.id
	end

	def create
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
