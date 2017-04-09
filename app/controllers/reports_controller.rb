class ReportsController < ApplicationController
	before_action :set_report, only: [:edit, :show, :update]

  def edit
  end

  def index
		@reports = Report.all.order("created_at DESC")
	end

  def show
  end

  def update
		if @report.update(alert_params)
			redirect_to reports_path, notice: "Report #{@report.id} has been updated"
		end
	end

		private

	def set_report
		@report = Report.find(params[:id])
	end

	def alert_params
		params.require(:report).permit(:status)
	end
end
