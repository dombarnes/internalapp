require 'rails_helper'

RSpec.describe "contracts/new.html.erb" do
  before(:each) do
    assign(:contract, stub_model(Contract,
      :contract_type => "MyString",
      :cost => "9.99",
      :contract_state => "MyString"
    ).as_new_record)
  end

  it "renders new contract form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", action: contracts_path, :method => "post" do
      assert_select "input#contract_contract_type", :name => "contract[contract_type]"
      assert_select "input#contract_cost", :name => "contract[cost]"
      assert_select "input#contract_contract_state", :name => "contract[contract_state]"
    end
  end
end
