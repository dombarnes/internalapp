require 'spec_helper'

RSpec.describe "contracts/show.html.erb" do
  before(:each) do
    @contract = assign(:contract, stub_model(Contract,
      :contract_type => "Contract Type",
      :cost => "9.99",
      :contract_state => "Contract State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contract Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contract State/)
  end
end
