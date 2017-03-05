class UpdatesController < ApplicationController

	def new
		@update = Update.new
	end

	def show
		@update = Update.find(params[:id])
	end
end
