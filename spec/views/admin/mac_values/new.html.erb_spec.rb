require 'spec_helper'

RSpec.describe UsersController do
  render_views

  describe '#show' do  
    before (:all) do
      @user = build(:user)
      UserSession.create(@user)
    end

    context 'given valid details' do   
      it 'should have the right title' do
        get :show, :id => @user
        response.should have_selector('title', :content => @user.name)
      end
      it 'should include the users name' do
        get :show, :id => @user
        response.should have_selector('h1', :content => @user.name)
      end
    end
  end #show
  
end
