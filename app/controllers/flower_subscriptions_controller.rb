class FlowerSubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

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
      .permit(:preferences, :size, :frequency, :delivery_day, :time_of_day))
    @flower_subscription.user_id = current_user.id
    if @flower_subscription.size == "Small"
      @flower_subscription.price = 25
    elsif @flower_subscription.size == "Medium"
      @flower_subscription.price == 40
    else @flower_subscription.size == "Large"
      @flower_subscription.price == 55
    end
    # humanized_money_with_symbol(@flower_subscription.price)
        
    # raise
    if @flower_subscription.save
      flash[:alert] = "Thank you for your order! Here is a summary of it"
      redirect_to flower_subscription_path
    else
      render :new
    end
  end

  def update
  end

  def new
  end

  def destroy
  end
end
