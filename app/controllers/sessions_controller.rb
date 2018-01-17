class SessionsController < ApplicationController
  before_action :set_user
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "You have logged in!"
      log_in(@user)
      redirect_to(@user)
    else
      flash.now[:danger] = "Invalid login credentials"
      render 'new'
    end
  end
  def destroy
  end

  private

  def set_user
    @user = current_user
  end
end
