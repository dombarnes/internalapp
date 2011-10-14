require 'spec_helper'

describe "invoices/index.html.erb" do
  before(:each) do
    assign(:invoices, [
      stub_model(Invoice,
        :purchase_order => "Purchase Order",
        :paid => false,
        :sub_total => "9.99",
        :vat_rate => "9.99",
        :vat_total => "9.99",
        :discount_total => "9.99",
        :total => "9.99",
        :company_id => 1
      ),
      stub_model(Invoice,
        :purchase_order => "Purchase Order",
        :paid => false,
        :sub_total => "9.99",
        :vat_rate => "9.99",
        :vat_total => "9.99",
        :discount_total => "9.99",
        :total => "9.99",
        :company_id => 1
      )
    ])
  end

  it "renders a list of invoices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Purchase Order".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
