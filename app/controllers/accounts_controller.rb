class AccountsController < ApplicationController
  def index
    @bookings = current_user.flower_subscriptions
    @order = current_user.flower_subscriptions.first
    @last_delivery = @order.delivery_date
    @delivery = delivery_check
  end

  def show
  end

  def update
  end

  def edit
  end

  def delivery_check
    if Date.today > @last_delivery
      next_delivery
    else
      @delivery = @last_delivery
    end

  end

  def next_delivery
    if @order.frequency == 1
      @next_delivery = @last_delivery + 28.days
    elsif @order.frequency == 2
      @next_delivery = @last_delivery + 14.days

    elsif @order.frequency == 4
      @next_delivery = @last_delivery + 7.days
    end
    @last_delivery = @next_delivery
  end
end
