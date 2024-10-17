class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
    @user = current_user
    @notes = @user.notes
  end

  private

  def authenticate_user
    unless session[:user_id] && current_user
      flash[:alert] = "You must be signed in to access this page."
      redirect_to new_session_path unless current_user
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

# def current_user
#     @current_user ||= User.find_by(user_id: session[:user_id]) if session[:user_id]
#   end
# end 