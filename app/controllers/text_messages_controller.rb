class TextMessagesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def send_text
		received_message = params["Body"]
		response = Twilio::TwiML::Response.new do |r|
			r.Sms "#{received_message}. Twilio implemented successfully."
		end

		render :xml => response.to_xml
	end

end
