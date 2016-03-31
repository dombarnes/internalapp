require 'rails_helper'

describe "contracts/edit.html.erb" do
  before(:each) do
    @contract = assign(:contract, stub_model(Contract,
      :contract_type => "MyString",
      :cost => "9.99",
      :contract_state => "MyString"
    ))
  end

  it "renders the edit contract form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", action: contracts_path(@contract), :method => "post" do
      assert_select "input#contract_contract_type", :name => "contract[contract_type]"
      assert_select "input#contract_cost", :name => "contract[cost]"
      assert_select "input#contract_contract_state", :name => "contract[contract_state]"
    end
  end
end
