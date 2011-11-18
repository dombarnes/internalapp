class InvoiceItemsController < ApplicationController
  before_filter :require_user
  helper_method :sort_column, :sort_direction
  filter_access_to :all

  def index
    @items = InvoiceItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  def show
    @item = InvoiceItem.find(:all)  #where[invoice_item.id => @item.id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def new
    @item = InvoiceItem.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  def edit
    @item = InvoiceItem.find(params[:id])
  end

  def create
    @item = InvoiceItem.new(params[:item])
    @item.invoice_id = @invoice
    total
    respond_to do |format|
      if @item.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    @item = InvoiceItem.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:invoice])
        format.html { redirect_to @item, notice: 'Invoice was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :ok }
    end
  end

end
