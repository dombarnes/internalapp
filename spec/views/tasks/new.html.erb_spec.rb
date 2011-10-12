require 'spec_helper'

describe "tasks/new.html.erb" do
  before(:each) do
    assign(:task, stub_model(Task,
      :person_id => 1,
      :task => "MyString",
      :category => "MyString",
      :private => false
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_person_id", :name => "task[person_id]"
      assert_select "input#task_task", :name => "task[task]"
      assert_select "input#task_category", :name => "task[category]"
      assert_select "input#task_private", :name => "task[private]"
    end
  end
end
