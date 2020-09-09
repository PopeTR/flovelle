class StripeCheckoutSessionService

  def call(event)
    @flower_subscription = FlowerSubscription.find_by(checkout_session_id: event.data.object.id)
    @flower_subscription.update(state: 'paid')
    message = "Your subscription has been successfully paid for and will arrive on #{@flower_subscription.delivery_date}!"
    p @flower_subscription.errors.full_messages
    notify(message)
  end

private

  def notify(message)
    MessageSender.send_message(
      @flower_subscription.id, "flovelle.com", User.find(@flower_subscription.user_id).phone_number, message)
    # redirect_to flower_subscriptions_url, notice: 'Message was delivered'
  end
end
