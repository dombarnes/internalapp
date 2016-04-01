require 'rails_helper'

RSpec.describe "notes/edit.html.erb" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :company_id => 1,
      :people_id => 1,
      :contract_id => 1,
      :adhoc_supports_id => 1,
      :notes => "MyText"
    ))
  end

  it "renders the edit note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", action: notes_path(@note), :method => "post" do
      assert_select "input#note_company_id", :name => "note[company_id]"
      assert_select "input#note_people_id", :name => "note[people_id]"
      assert_select "input#note_contract_id", :name => "note[contract_id]"
      assert_select "input#note_adhoc_supports_id", :name => "note[adhoc_supports_id]"
      assert_select "textarea#note_notes", :name => "note[notes]"
    end
  end
end
