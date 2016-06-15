class SessionsController < ApplicationController

  def new
  	@user = User.new
  end

def create

  @user = User.find_by(email: user_params[:email])
  if @user && @user.authenticate(user_params[:password])
    #log_in(user)
    #reset_user_session
    session[:user] = @user.id # <--- login
    redirect_to params[:referer].present? ? params[:referer] : users_path
  else
    @user = User.new
    flash.now[:referer] = params[:referer]
    flash.now[:error] = true
    render :new
  end
end

def delete
  session[:user] = nil
  redirect_to login_path
end

private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end