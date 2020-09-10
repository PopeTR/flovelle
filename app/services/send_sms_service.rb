require 'twilio-ruby'

class SendSmsService

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
      from:  "+12057075110",
      to:    to,
      body:  message,
      status_callback: "https://www.#{host}/flower_subscriptions/#{flower_subscription_id}"
    )
  end

end
