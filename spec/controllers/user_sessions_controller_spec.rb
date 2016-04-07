require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller  do
  setup :activate_authlogic
  describe '#create' do
    # let(:password) { rand_text(8) }
    # let(:user) { create(:user, password: password) }
    before(:all) do
      # Create a new user to test with
      user = create(:user)
    end

    context 'given valid credentials' do
      it 'sets the user in the session and redirects them to their dashboard' do
        post '/login', user_session: { email: user.email, password: user.password }
        # expect(flash[:notice]).to set_flash.now[:notice].to(/You have been logged in/)
        expect(response).to have_http_status(:success)
        expect(controller.user).to eq user
      end
    end

    context 'given invalid credentials' do
      it 'renders the page with error' do
        user = create(:user)
        post :create, user_session: { email: user.email, password: 'invalid' }
        expect(response).to render_template(:new)
        expect(flash[:notice]).to match(/^Email and password do not match/)
      end
    end
  end #create

  describe '#destroy' do
    context 'when logged in' do
      it 'deletes session and redirect to home' do
        test_sign_in(:user)
        delete :destroy
        expect(response).to render_template(:new)
        expect(controller).to_not be_signed_in
        expect(flash[:notice]).to match(/^You have been logged out./)
        expect(response).to redirect_to root_path
      end
    end

    context 'when not logged in' do
      it 'redirect to login page' do
        expect(response).to redirect_to root_path
      end
    end
  end #destroy

  describe '#new' do
    context 'when loading a new session' do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end    
      it "should have the right title" do
        get :new
        expect(response).to have_selector("title", content => "Sign In")
      end
    end
  end #new
end
