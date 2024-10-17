class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    flash.clear  # Clear flash messages here
  end

  def create
    @user = User.new(user_params)
    Rails.logger.debug "User Params: #{user_params.inspect}"

    if @user.save
      # redirect_to @user
      redirect_to signin_path
    else
      Rails.logger.debug @user.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      # redirect_to @user
      redirect_to @user, notice: 'User was successfully updated.'
    else
      # render :new, alert: 'Error creating user.'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, notice: "User was successfully deleted."

    # redirect_to root_path, status: :see_other
  end

  private
  # Define a private method called user_params.
    def user_params
    # Use the params method to access the parameters submitted in the request.
    # Call the require method to ensure that the 'user' parameter is present in the request.
    # Call the permit method to specify which attributes of the 'user' parameter are allowed to be mass-assigned.
      params.require(:user).permit(:username, :email, :password, :confirm_password)
    end
end