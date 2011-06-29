class IosQuotesController < ApplicationController
  before_filter :require_user
  helper_method :sort_column, :sort_direction
#  filter_access_to :all

  def create
    @title = "New Quote"
    @ios_quote = current_user.ios_quotes.build(params[:ios_quote])
    @ios_value = IosValue.last
	@ios_quote.ios_values_id = IosValue.last.id
    if @ios_quote.install_required = "1"
      @ios_quote.install_cost = ((@ios_value.iosdevice_install_setup + (@ios_value.iosdevice_install_time * @ios_quote.device_quantity))/7).ceil * @ios_value.daily_rate
    end
    if @ios_quote.support_required = "1"
      @ios_quote.support_cost = (@ios_value.iosdevice_support_cost * @ios_quote.device_quantity)
    end
    if @ios_quote.save
      flash[:success] = "Quote saved!"
      redirect_to @ios_quote
    else
      render 'home/ios_quotes'
    end
  end
  
  def index
     @ios_quotes = IosQuote.paginate(:per_page => 10, :page => params[:id])
      @title = "iOS Quotes"
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @ios_quote }
      end
      @ios_quote = IosQuote.paginate(:page => params[:page])
  end
  
  def show
    @ios_quote = IosQuote.find(params[:id])
	  @title = "Quote for " + @ios_quote.customer
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ios_quote }
    end
  end
  
  def update
	@ios_quote = IosQuote.find(params[:id])
	@ios_value = IosValue.find(:all, :conditions => ["id =  '@ios_quote.ios_values_id'"])
    if @ios_quote.install_required = "1"
      @ios_quote.install_cost = ((@ios_value.iosdevice_install_setup + (@ios_value.iosdevice_install_setup * @ios_quote.device_quantity)/7)).ceil  * @ios_value.daily_rate
    end
    if @ios_quote.support_required = "1"
      @ios_quote.support_cost = (@ios_values.iosdevice_support_cost * @ios_quote.device_quantity).ceil
    end
    respond_to do |format|
      if @ios_quote.update_attributes(params[:ios_quote])
        format.html { redirect_to(@ios_quote, :notice => 'Your quote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ios_quote.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def mark_as_won
  @ios_quote.won = "1"
  if @ios_quote.update_attributes(params[:id])
    redirect_to(ios_quotes_path, :notice => "Quote has been marked as won!")
  end
  end
  
  def new
    @ios_quote = IosQuote.new
    @title = "New iOS Quote"
  end
  
  def destroy
    @ios_quote = IosQuote.find(params[:id]).destroy
    flash[:success] = "Quote deleted"
    redirect_back_or_default ios_quotes_path
  end

  def edit
    @title = "Edit Quote"
    @ios_quote = IosQuote.find(params[:id])
  end
    
end