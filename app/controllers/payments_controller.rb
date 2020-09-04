class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
	def index

	end

  def new
    @flower_subscription = current_user.flower_subscriptions.find(params[:id])
    user_id = @flower_subscription.user_id
    first_name = User.find(user_id).first_name
    last_name = User.find(user_id).last_name
  end
end
