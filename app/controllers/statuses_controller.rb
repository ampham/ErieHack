class StatusesController < ApplicationController

	def new
		@status = Status.new
	end

	def create
		@user = current_user
		@status = Status.new(allowed_params)
		@status.user_id

		if @status.save
			flash[:success] = "Created new status"
			redirect_to @status
		else
			render 'new'
		end
	end

	def show
		@status = Status.find(params[:id])
	end

	private

		def allowed_params
			params.require(:update).permit(:o2, :conductivity, :pH, :turbidity, :temp, :user_id, :location_id)
		end

end
