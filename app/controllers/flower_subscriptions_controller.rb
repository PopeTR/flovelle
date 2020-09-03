class FlowerSubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  def index
    @flower_subscriptions = FlowerSubscription.all
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
