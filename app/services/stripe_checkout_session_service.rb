class StripeCheckoutSessionService

  def call(event)
    @flower_subscription = FlowerSubscription.find_by(checkout_session_id: event.data.object.id)
    @flower_subscription.update(state: 'paid')
    message = "Congratulations flower-lover! Your subscription has been successfully paid for and will arrive on #{@flower_subscription.delivery_date.strftime("%a")}, #{@flower_subscription.delivery_date.strftime("%d")} #{@delivery.strftime("%b")}!"
    notify(message)
  end


private

  def notify(message)
    SendSmsService.send_message(
      FlowerSubscription.last.id, "flovelle.com", User.last.phone_number, message)
    redirect_to flower_subscriptions_url, notice: 'Message was delivered'
  end
end
