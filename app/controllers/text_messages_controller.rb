class TextMessagesController < ApplicationController

	def send_text
		#content_type 'text/xml'

		response = Twilio::TwiML::Response.new do |r|
			r.Sms = 'Hey this is a message from Riverkeeper Datacenter'
		end

		render :xml => response.to_xml
	end

end
