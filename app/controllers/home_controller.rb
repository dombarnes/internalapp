class HomeController < ApplicationController
  def index
    @title = "Internal Client Management"
  end
  def help
    @title = "Help"
  end
  def clients
    @title = "Client Management"
  end
  def adhocsupport
    @title = "Ad Hoc Support Management"
  end
  def root
    @title = "Home"
  end
  
end
