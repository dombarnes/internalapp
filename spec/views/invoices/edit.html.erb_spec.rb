require 'spec_helper'

describe "invoices/edit.html.erb" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :purchase_order => "MyString",
      :paid => false,
      :sub_total => "9.99",
      :vat_rate => "9.99",
      :vat_total => "9.99",
      :discount_total => "9.99",
      :total => "9.99",
      :company_id => 1
    ))
  end

  it "renders the edit invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invoices_path(@invoice), :method => "post" do
      assert_select "input#invoice_purchase_order", :name => "invoice[purchase_order]"
      assert_select "input#invoice_paid", :name => "invoice[paid]"
      assert_select "input#invoice_sub_total", :name => "invoice[sub_total]"
      assert_select "input#invoice_vat_rate", :name => "invoice[vat_rate]"
      assert_select "input#invoice_vat_total", :name => "invoice[vat_total]"
      assert_select "input#invoice_discount_total", :name => "invoice[discount_total]"
      assert_select "input#invoice_total", :name => "invoice[total]"
      assert_select "input#invoice_company_id", :name => "invoice[company_id]"
    end
  end
end
