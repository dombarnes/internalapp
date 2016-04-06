require 'spec_helper'

RSpec.describe "user_sessions/new.html.erb" do
  it 'displays login fields' do
    render

    expect(rendered).to contain('Please login')
  end
end
