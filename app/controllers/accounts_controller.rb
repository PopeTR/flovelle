class AccountsController < ApplicationController
  def index
    @bookings = current_user.flower_subscriptions
    @order = current_user.flower_subscriptions.first
  end

  def show
  end

  def update
  end

  def edit
  end
end
