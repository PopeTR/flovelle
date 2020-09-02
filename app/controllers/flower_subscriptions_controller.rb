class FlowerSubscriptionsController < ApplicationController
  def index
    @flower_subscriptions = FlowerSubscription.all
    @flower_subscription = FlowerSubscription.new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def new
  end

  def destroy
  end
end
