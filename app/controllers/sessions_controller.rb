class SessionsController < ApplicationController
  before_action :logged_in_req, except: [:new, :create, :home, :omniauth]

  def new
    @user = User.new
    @users = User.all
  end

  def create
  end

  def omniauth
  end

  def destroy
  end

private

  def auth
  end
end
