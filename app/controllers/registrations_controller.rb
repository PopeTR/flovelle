class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
   flower_subscriptions_path
  end
end
