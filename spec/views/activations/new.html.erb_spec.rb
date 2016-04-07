require 'rails_helper'

RSpec.describe "activations/new" do
  before (:all) do
    @user = build(:user)
  end

  context 'given valid details' do   
    it 'should have the right title' do
      render
      expect(rendered).to have_selector('h1', text: "Activate your account")
    end
  end
  
  context 'given an invalid activation code' do
    it 'should fail and warn user' do
      render
      expect(flash[:error])
    end
  end

end #show
