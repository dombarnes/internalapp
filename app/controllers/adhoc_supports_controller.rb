class AdhocSupportsController < ApplicationController
  # GET /adhoc_supports
  # GET /adhoc_supports.xml
  def index
    @adhoc_supports = AdhocSupport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adhoc_supports }
    end
  end

  # GET /adhoc_supports/1
  # GET /adhoc_supports/1.xml
  def show
    @adhoc_support = AdhocSupport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adhoc_support }
    end
  end

  # GET /adhoc_supports/new
  # GET /adhoc_supports/new.xml
  def new
    @adhoc_support = AdhocSupport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adhoc_support }
    end
  end

  # GET /adhoc_supports/1/edit
  def edit
    @adhoc_support = AdhocSupport.find(params[:id])
  end

  # POST /adhoc_supports
  # POST /adhoc_supports.xml
  def create
    @adhoc_support = AdhocSupport.new(params[:adhoc_support])

    respond_to do |format|
      if @adhoc_support.save
        format.html { redirect_to(@adhoc_support, :notice => 'Adhoc support was successfully created.') }
        format.xml  { render :xml => @adhoc_support, :status => :created, :location => @adhoc_support }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adhoc_support.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /adhoc_supports/1
  # PUT /adhoc_supports/1.xml
  def update
    @adhoc_support = AdhocSupport.find(params[:id])

    respond_to do |format|
      if @adhoc_support.update_attributes(params[:adhoc_support])
        format.html { redirect_to(@adhoc_support, :notice => 'Adhoc support was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @adhoc_support.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /adhoc_supports/1
  # DELETE /adhoc_supports/1.xml
  def destroy
    @adhoc_support = AdhocSupport.find(params[:id])
    @adhoc_support.destroy

    respond_to do |format|
      format.html { redirect_to(adhoc_supports_url) }
      format.xml  { head :ok }
    end
  end
end
