class SessionsController < ApplicationController

  # Set as login_path
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to admin_path
    else
      session[:user_id] = nil # For good measure
      redirect_to root_path
    end
  end

  # Set as logout_path
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
