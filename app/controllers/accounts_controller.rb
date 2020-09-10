class AccountsController < ApplicationController
  def index
    if current_user.role == "manager"
      dashboard
    elsif current_user.flower_subscriptions.empty?
      @bookings = current_user.flower_subscriptions
      @order = current_user.flower_subscriptions.last
    else
      # If they have a delivery
      @bookings = current_user.flower_subscriptions
      @order = current_user.flower_subscriptions.order(updated_at: :asc).last
      @last_delivery = @order.delivery_date
      @delivery = delivery_check
    end
  end

  def dashboard
    @suppliers = Supplier.all
    @users = User.all
    @flower_subscriptions = FlowerSubscription.all
  end

  def show
  end

  def update
  end

  def edit
    @user = User.find(current_user.id)
  end

  def delivery_check
    if Date.today > @last_delivery
      next_delivery
    else
      @delivery = @last_delivery
    end

  end

  def next_delivery
    if @order.Monthly?
      @next_delivery = @last_delivery + 28.days
    elsif @order.Forthnightly?
      @next_delivery = @last_delivery + 14.days
    elsif @order.Weekly?
      @next_delivery = @last_delivery + 7.days
    end
    @last_delivery = @next_delivery
  end

end
