class HomeController < ApplicationController
  def landing
    
    @show_filters = true
    @page = "home"
  end
end
