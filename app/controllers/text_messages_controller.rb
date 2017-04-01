class TextMessagesController < ApplicationController
	skip_before_action :verify_authenticity_token


	def reply_zip

	end



	# TODO: Move a lot of this into the models
	def send_text
		received_message = params["Body"]
		if received_message.start_with?("GET")
			# If the message starts with "GET" then we're returning a Location's status
			substrings = received_message.split
			location_id = substrings[1].to_i
			# the parameters we'll be texting back
			location_name = Location.find_by(id: location_id).title
			conductivity = Location.find_by(id: location_id).statuses.last.conductivity
			o2 = Location.find_by(id: location_id).statuses.last.o2
			ph = Location.find_by(id: location_id).statuses.last.pH
			turbidity = Location.find_by(id: location_id).statuses.last.turbidity

			# Build the response object to send
			response = Twilio::TwiML::Response.new do |r|
				r.Sms "You have asked for data on #{location_name}." +
				"\n\n Conductivity: #{conductivity}%" +
				"\n Dissolved O2: #{o2}%" +
				"\n pH: #{ph}%" +
				"\n Turbidity: #{turbidity}%"
			end
		# If the message starts with "POST" then we're saving a new update (DEPRECATED!)
		elsif received_message.start_with?("POST")
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
