class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_flash_messages
  helper_method :current_user

  private

  def set_flash_messages
    if params[:controller] == 'sessions' && params[:action] == 'create'
      user = User.find_by(username: params[:username])
      flash.now[:alert] = "User not found. Please sign up first." unless user
    end
  end

  def after_sign_in_path_for(resource)
    path = notes_path
    puts "Redirecting to: #{path}"
    path
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

# def current_user
#     @current_user ||= User.find_by(user_id: session[:user_id]) if session[:user_id]
#   end
# end