class UsersController < ApplicationController
  def show
    if params[:id] != session[:user].to_s
      redirect_to user_path(session[:user])
      return
    end
    @user = User.find(session[:user])
  end

  def sign_up
  end

  def sign_up_submit
    u = User.find_by_username(params[:username])
    if u != nil
      flash[:notice] = "Username " + params[:username] + " already exists"
      redirect_to "/users/sign_up"
    else
      u = User.create(:username => params[:username], :email => params[:email], :password => Digest::MD5.hexdigest(params[:password]))
      session[:user] = u.id
      redirect_to user_path(u)
    end
  end

  def login
  end

  def login_submit
    u = User.find_by_username(params[:username])
    if u == nil
      flash[:notice] = "Could not find username " + params[:username]
      redirect_to "/users/login"
      return
    elsif Digest::MD5.hexdigest(params[:password]) == u.password
      session[:user] = u.id
      redirect_to user_path(u)
    else
      flash[:notice] = "incorrect password"
      redirect_to "/users/login"
      return
    end
  end

  def logout
    session[:user] = nil
    redirect_to "/home/landing"
  end
end
