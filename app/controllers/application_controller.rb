class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_devise_params, if: :devise_controller?
  # def after_sign_in_path_for(resource)
  #   if request.referer == "http://localhost:3000/flower_subscriptions"
  #     "/flower_subscriptions"
  #   else
  #     request.referer
  #   end
  # end



  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :address])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end


end
