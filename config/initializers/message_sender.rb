class MessageSender
  def self.send_message(flower_subscription_id, host, to, message)
    new.send_message(flower_subscription_id, host, to, message)
  end

  def initialize
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/console
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

   def send_message(flower_subscription_id, host, to, message)
    @client.messages.create(
      from:  twilio_number,
      to:    to,
      body:  message,
      status_callback: "http://#{host}/orders/#{flower_subscription_id}/status"
    )
  end
end
