class SessionsController < ApplicationController
  before_action :logged_in_req, except: [:new, :create, :home, :omniauth]

  def new
    @user = User.new
    @users = User.all
  end
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to signin_path, :notice => "Unable to sign you in, credentials unrecognized. Please try again."
    end
  end


  def omniauth
    if auth = request.env["omniauth.auth_hash"]
      user = User.find_or_create_by_oa(auth)
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Signed In!"
    else
      redirect_to root_path, :notice => "Unable to sign you in, please check your credentials and try again."
    end
  end


  def destroy
    session.clear
    redirect_to root_path, :notice => "Logged Out"
  end

private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
