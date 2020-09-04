class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :configure_devise_params, if: :devise_controller?
  # def after_sign_in_path_for(resource)
  #   if request.referer == "http://localhost:3000/flower_subscriptions"
  #     "/flower_subscriptions"
  #   else
  #     request.referer
  #   end
  # end


end
