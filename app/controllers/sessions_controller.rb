class SessionsController < ApplicationController
  before_action :set_user

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "You have logged in!"
      log_in(@user)
      redirect_to(root_path)
    else
      flash.now[:danger] = "Invalid login credentials"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

  private

  def set_user
    @user = current_user
  end
end
