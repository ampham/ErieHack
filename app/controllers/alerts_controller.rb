class AlertsController < ApplicationController
	before_action :set_alert, only: [:edit, :show, :update]

	def index
		@alerts = Alert.all.order("created_at DESC")
	end

	def edit
	end

	def show
	end

	# TODO: Tighten up params in general
	def update
		if @alert.update(alert_params)
			redirect_to alerts_path, notice: "Alert #{@alert.id} has been updated"
		end
	end

	private

	def set_alert
		@alert = Alert.find(params[:id])
	end

	def alert_params
		params.require(:alert).permit(:status)
	end
end
