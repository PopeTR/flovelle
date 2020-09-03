class StripeCheckoutSessionService
  def call(event)
    flower_subscription = FlowerSubscription.find_by(checkout_session_id: event.data.object.id)
    flower_subscription.update(state: 'paid')
  end
end
