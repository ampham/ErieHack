class TextMessagesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def send_text
		#content_type 'text/xml'

		response = Twilio::TwiML::Response.new do |r|
			#r.Say "Yay! You're on Rails!", voice: "alice"
			r.Sms "You have reached Riverkeeper Datacenter. Twilio implemented successfully."
			#r.Play "http://linode.rabasa.com/cantina.mp3"
		end

		render :xml => response.to_xml
	end

end
