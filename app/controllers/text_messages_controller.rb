class TextMessagesController < ApplicationController

	def send_text
	  sender = params[:From]
	  friends = {
	    "+14153334444" => "Curious George",
	    "+14158157775" => "Boots",
	    "+14155551234" => "Virgil"
	  }
	  name = friends[sender] || "Mobile Monkey"
	  twiml = Twilio::TwiML::Response.new do |r|
	    r.Message "Hello, #{name}. Thanks for the message."
	  end
	  twiml.text	
	end
	
end
