class HomeController < ApplicationController
  def index
    @title = "Internal Client Management"
  end
  def help
    @title = "Help"
  end
end
