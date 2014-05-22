class HomeController < ApplicationController
  def landing
    if session[:user] == nil
      redirect_to "/users/login"
      return
    end
  end
end
