class BuffaloReportsController < ApplicationController

	def index
		@reports = BuffaloReport.all
	end
end
