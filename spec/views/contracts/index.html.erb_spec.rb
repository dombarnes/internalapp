require 'rails_helper'

describe "contracts/index.html.erb" do
  before(:each) do
    assign(:contracts, [
      stub_model(Contract,
        :contract_type => "Contract Type",
        :cost => "9.99",
        :contract_state => "Contract State"
      ),
      stub_model(Contract,
        :contract_type => "Contract Type",
        :cost => "9.99",
        :contract_state => "Contract State"
      )
    ])
  end

  it "renders a list of contracts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contract Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contract State".to_s, :count => 2
  end
end
