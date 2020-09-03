class PaymentsController < ApplicationController
	def index

	end

  def new
    @flower_subscription = current_user.flower_subscriptions.find(params[:id])
  end
end
