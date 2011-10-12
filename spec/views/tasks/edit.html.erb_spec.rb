require 'spec_helper'

describe "tasks/edit.html.erb" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :person_id => 1,
      :task => "MyString",
      :category => "MyString",
      :private => false
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path(@task), :method => "post" do
      assert_select "input#task_person_id", :name => "task[person_id]"
      assert_select "input#task_task", :name => "task[task]"
      assert_select "input#task_category", :name => "task[category]"
      assert_select "input#task_private", :name => "task[private]"
    end
  end
end
