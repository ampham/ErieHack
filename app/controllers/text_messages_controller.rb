class TextMessagesController < ApplicationController
	skip_before_action :verify_authenticity_token

	# TODO: Move a lot of this into the Update model
	def send_text
		received_message = params["Body"]
		# If the message starts with "POST" then we're saving a new update
		if received_message.start_with?("POST")
			# Split the message and get rid of "POST" as we don't need it
			substrings = received_message.split
			substrings.delete_at(0)
			# get a new array and split each key-value, saving only the values
			values = []
			substrings.each do |s|
				keyval = s.split(":")
				values << keyval[1]
			end
			# Save the values as a new Update in the database
			Update.create_from_text(values[0].to_f, values[1].to_f, values[2].to_f)

			response = Twilio::TwiML::Response.new do |r|
				r.Sms "You have posted #{values[0]} lead, #{values[1]} mercury and #{values[2]} plutonium."
			end
		else 
			# If the message doesn't start with "POST", just say something nice
			response = Twilio::TwiML::Response.new do |r|
				r.Sms "You said #{received_message}. Thanks for playing!"
			end
		end
		render :xml => response.to_xml
	end
end
