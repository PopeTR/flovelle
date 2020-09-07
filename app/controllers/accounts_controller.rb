class AccountsController < ApplicationController
  def index
    @bookings = current_user.flower_subscriptions
    @suppliers = Supplier.all
    @users = User.all
    @flower_subscriptions = FlowerSubscription.all
  end

  def show
  end

  def update
  end

  def edit
  end
end
