class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery unless -> {request.format.json? }

  #configure redirect path after login with devise
  def after_sign_in_path_for(resource)
    user_profile_path(current_user) #your path
  end
end
