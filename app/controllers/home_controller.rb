class HomeController < ApplicationController
#  filter_access_to :all
  
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

  def macquote
    @title = "Mac Install & Support Quotes"
  end

  def dashboard
    @title = "Dashboard"
  end

  def quotes
    @title = "Quote Dashboard"
  end
end
