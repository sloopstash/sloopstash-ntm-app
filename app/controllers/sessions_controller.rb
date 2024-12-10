class SessionsController < ApplicationController
  def new
    # Render the signin form
  end

  def create
  user = User.find_by(username: params[:username])

  
  if user && user.authenticate(params[:password])
    # If the user is found and the password is correct, sign in the user
    session[:user_id] = user.id
    redirect_to dashboard_path# Redirect to the dashboard
  else
    # If the user is not found or the password is incorrect, display an error message
    # flash.now[:error] = 'Invalid username or password. Please try again.'
    if user.nil?
        flash[:notice] = "Please sign up first."
        redirect_to new_user_path
    
    else
      
      flash.now[:alert] = "Invalid username or password"
    render "new"
  end
end
end

def dashboard
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to root_path, alert: "You must be signed in to access this page."
    end
  end

  def destroy
    # Sign out the user
    session[:user_id] = nil
    redirect_to root_path
  end
end



