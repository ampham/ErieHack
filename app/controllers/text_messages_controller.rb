class TextMessagesController < ApplicationController

	def send_text do
    number_to_send_to = params[:number_to_send_to]

    twilio_sid = "PN43a9a5f3c5a4803bac1c6de8f206e6df"
    twilio_token = "5646ec386444e72c0fc4b31cadbcb46c"
    twilio_phone_number = "+13478945155"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "This is an message. It gets sent to #{number_to_send_to}"
		)
	end

end
