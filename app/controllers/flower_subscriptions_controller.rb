class FlowerSubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :create]
  skip_before_action :verify_authenticity_token

  def index
    @flower_subscriptions = FlowerSubscription.all
    @flower_subscription = FlowerSubscription.new
  end

  def show
    @flower_subscription = current_user.flower_subscriptions.find(params[:id])
  end

  def edit
  end

  def create
    @flower_subscription = FlowerSubscription.new(params[:flower_subscription]
      .permit(:preferences, :state, :price_cents, :flower_subscription_sku, :size, :frequency, :delivery_day, :time_of_day))
    @flower_subscription.user_id = current_user.id
    if @flower_subscription.size == "Small"
      @flower_subscription.price_cents = 2500
    elsif @flower_subscription.size == "Medium"
      @flower_subscription.price_cents == 4000
    else @flower_subscription.size == "Large"
      @flower_subscription.price_cents == 5500
    end

    if @flower_subscription.frequency == "Monthly"
      @flower_subscription.frequency = 1
    elsif @flower_subscription.frequency == "Biweekly"
      @flower_subscription.frequency == 2
    else @flower_subscription.frequency == "Weekly"
      @flower_subscription.frequency == 4
    end

    if @flower_subscription.time_of_day == "Morning"
      @flower_subscription.time_of_day = "Between 8am-12pm"
    elsif @flower_subscription.time_of_day == "Afternoon"
      @flower_subscription.time_of_day == "Between 13pm-15pm"
    else @flower_subscription.time_of_day == "Evening"
      @flower_subscription.time_of_day == "Between 15pm-18pm"
    end

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

    # raise
    # if @flower_subscription.save
    #   flash[:alert] = "Thank you for your order! Here is a summary of it"
    #   redirect_to flower_subscription_path
    # else
    #   render :new
    # end
  end

  def update
  end

  def new
  end

  def destroy
  end
end
