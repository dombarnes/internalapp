class HomeController < ApplicationController

  def index
    @title = "Home"
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
  def supportquote
    @title = "Support Quotes"
  end
  def installquote
    @title = "Install Quotes"
  end
  def dashboard
    @title = "Dashboard"
  end
  def quotes
    @title = "Quote Dashboard"
  end
end
