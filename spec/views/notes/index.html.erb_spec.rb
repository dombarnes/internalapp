require 'rails_helper'

describe "notes/index.html.erb" do
  before(:each) do
    assign(:notes, [
      stub_model(Note,
        :company_id => 1,
        :people_id => 1,
        :contract_id => 1,
        :adhoc_supports_id => 1,
        :notes => "MyText"
      ),
      stub_model(Note,
        :company_id => 1,
        :people_id => 1,
        :contract_id => 1,
        :adhoc_supports_id => 1,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
