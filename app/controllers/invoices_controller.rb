class InvoicesController < ApplicationController
  before_filter :require_user
  filter_resource_access


  def index
    @invoices = Invoice.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    @items = InvoiceItem.where(:invoice_id => @invoice.id)

    respond_to do |format|
      format.html # show.html.erb
      format.pdf { render :layout => false }
      format.json { render json: @invoice }
    end
  end

  def new
    @invoice = Invoice.new
    @item = InvoiceItem.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.status = "Draft"
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.xml { render xml: @invoice, status: :draft, location: @invoice }
        format.json { render json: @invoice, location: @invoice }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
        format.xml { render xml: @invoice.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :ok }
    end
  end

  def download_pdf
    invoice = Invoice.find(params[:id])
    send_data generate_pdf(invoice),
              :filename => "#{invoice.id + "_" + invoice.id}.pdf",
              :type => "application/pdf"
  end

private

  def generate_pdf(client)
    Prawn::Document.new do
      text client.name, :align => :center
      text "Address: #{client.address}"
      text "Email: #{client.email}"
    end.render
  end
end
