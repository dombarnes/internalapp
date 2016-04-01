require 'rails_helper'

RSpec.describe UsersController do
  render_views

  describe '#new' do  
    before (:all) do
      @user = build(:user)
      UserSession.create(@user)
    end

    context 'given valid details' do   
      it 'should have the right title' do
        get :show, :id => @user
        expect(response).to have_selector('h1', :content => "Activate your account")
      end
    end
  end #show
  
end
