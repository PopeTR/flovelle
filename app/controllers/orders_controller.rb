class OrdersController < ApplicationController

  def create
    flower_sub = FlowerSubscription.find(params[:flower_subscription_id])
    order = Order.create!(flower_subscription_id: flower_sub.id, flower_subscription_sku: flower_sub.sku, amount: flower_sub.price, state: 'pending')

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: teddy.sku,
      images: [teddy.photo_url],
      amount: teddy.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)

  end
end
