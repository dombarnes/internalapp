class MacQuotesController < ApplicationController
#  load_and_authorize_resource # For declarative authorization
#  filter_resource_access

  before_filter :require_user, :only => [:edit, :update, :index, :destroy]
  before_filter :admin_user, :only => :destroy
  helper_method :sort_column, :sort_direction
  
  def create
    @mac_quote = current_user.mac_quotes.build(params[:mac_quote])
    @quote_values = MacValues.last
    @mac_quote.mac_values_id = @quote_values.id
    if @mac_quote.save
      flash[:success] = "Quote saved!"
      redirect_to mac_quotes_path
    else
      render 'home/index'
    end
  end
  
  def new
    @title = "New Mac Quotation"
    @mac_quote = MacQuote.new
  end
  
  def edit
    
  end
  
  def update
    @mac_quote = MacQuote.find(params[:id])
  	@mac_values = @mac_quote.mac_values_id
      if install_required == "1"
#        @mac_quote.install_cost = 
      end
      if support_required == "1"
#        @ios_quote.support_cost =
      end
      respond_to do |format|
        if @mac_quote.update_attributes(params[:ios_quote])
          format.html { redirect_to(@mac_quote, :notice => 'Your quote was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @mac_quote.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def show
    @mac_quote = MacQuote.find(params[:id])
	  @title = "Quote for " + @mac_quote.customer
    
  end
 
  def index
    @mac_quotes = MacQuote.all.paginate(:per_page => 5, :page => params[:id])
    @mac_quote = MacQuote.paginate(:page => params[:page])
  end
  
  def destroy
  end
end