class FlowerSubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  def index
    @flower_subscriptions = FlowerSubscription.all
  end

  def show
    @flower_subscription = current_user.flower_subscriptions.find(params[:id])
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
