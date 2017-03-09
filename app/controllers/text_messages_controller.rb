class TextMessagesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def send_text
		received_message = params["Body"]

		if received_message.start_with?("POST")
			substrings = received_message.split
			substrings.delete_at(0)
			values = []
			substrings.each do |s|
				keyval = s.split(":")
				values << keyval[1]
			end

			Update.create_from_text(values[0].to_f, values[1].to_f, values[2].to_f)

			response = Twilio::TwiML::Response.new do |r|
				r.Sms "You would like to post #{values[0]} lead, #{values[1]} mercury and #{values[2]} plutonium."
			end
		else 
			response = Twilio::TwiML::Response.new do |r|
				# NOTE there are a lot more things you can do with Response objects
				r.Sms "#{received_message}. Twilio implemented successfully."
			end
		end
		render :xml => response.to_xml
	end
end
