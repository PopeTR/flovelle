class FlowerSubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :create]
  skip_before_action :verify_authenticity_token

  def index
    @flower_subscriptions = FlowerSubscription.all
    @flower_subscription = FlowerSubscription.new
  end

  def show
    @flower_subscription = FlowerSubscription.find(params[:id])
  end

  def new

  end

  def create
    @flower_subscription = FlowerSubscription.new(flower_params)
    @flower_subscription.user_id = current_user.id

    @flower_subscription = FormatSubscriptionService.new(flower_subscription: @flower_subscription).call

    @flower_subscription.save!

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @flower_subscription.size,
      amount: @flower_subscription.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: flower_subscription_url(@flower_subscription),
    cancel_url: flower_subscription_url(@flower_subscription)
    )

    @flower_subscription.update(checkout_session_id: session.id)
    redirect_to new_payment_path(@flower_subscription.id)
    # humanized_money_with_symbol(@flower_subscription.price_cents)
  end

  def edit
    @flower_subscription = FlowerSubscription.find(params[:id])
  end

  def update
    @flower_subscription = FlowerSubscription.find(params[:id])
    # @flower_subscription = FormatSubscriptionService.new(flower_subscription: @flower_subscription).call
    @flower_subscription.update(flower_params)
    # raise
    redirect_to flower_subscription_path(@flower_subscription)
  end

  def destroy
    @flower_subscription = FlowerSubscription.find(params[:id])
    @flower_subscription.destroy
    redirect_to accounts_path
  end

  def status
    @flower_subscription.notification_status = params["MessageStatus"]
    @flower_subscription.save
    render nothing: true
  end

  private

  def flower_params
    params.require(:flower_subscription).permit(:price_cents, :preferences, :size, :frequency, :delivery_day, :delivery_date, :time_of_day)
  end

end
