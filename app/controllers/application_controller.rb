class ApplicationController < ActionController::Base
  helper_method :current_user

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    return nil if session[:user_id].nil?

    User.find(session[:user_id]) unless session[:user_id].nil?
  end
end
