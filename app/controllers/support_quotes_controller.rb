class SupportQuotesController < ApplicationController
#  load_and_authorize_resource # For declarative authorization
  filter_resource_access

  before_filter :require_user, :only => [:edit, :update, :index, :destroy]
  before_filter :admin_user, :only => :destroy
  helper_method :sort_column, :sort_direction


  def index 
    @title = "Mac Support Quotes"
    @support_quotes = SupportQuotes.all.paginate(:per_page => 5, :page => params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @support_quote }
    end
    @support_quote = SupportQuote.paginate(:page => params[:page])
  end

  def new 
    @support_quote = SupportQuote.new
    @title = "New Support Quote"
  end  
  
  def create

  end

  def show
    @title = "Support Quote for " + @support_quote.customer
    @support_quote = SupportQuote.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @support_quote }
    end
  end
  
  def edit
    @title = "Edit Support Quote"
    @support_quote = SupportQuote.find(params[:id])
  end
  
  def update
    
  end
  
  def destroy
     @support_quote = SupportQuote.find(params[:id]).destroy
      flash[:success] = "Quote deleted"
      redirect_to quotes_path
  end
  
end