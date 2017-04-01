class BuffaloReportsController < ApplicationController

	def index
		@reports = BuffaloReport.all
	end

	def test
		@zip = params["zip"]
	end
end
