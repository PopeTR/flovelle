class PaymentsController < ApplicationController
	def index

	end

  def new
    @flower_subscription = current_user.flower_subscriptions.where(state: 'pending').find(params[:flower_subscription_id])
  end
end
