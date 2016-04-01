require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do  
  describe '#create' do
    # let(:password) { rand_text(8) }
    # let(:user) { create(:user, password: password) }
    before(:all) do
      user = build(:user)
    end

    context 'given valid credentials' do
      it 'sets the user in the session and redirects them to their dashboard' do
        user = create(:user)
        post :create, session: { email: user.email, password: user.password }
        expect(response).to redirect_to root_url
        expect(flash[:notice]).to match(/^You have been logged in/)
        expect(controller.current_user).to eq user
      end
    end

    context 'given invalid credentials' do
      it 'renders the page with error' do
        user = create(:user)
        post :create, session: { email: user.email, password: 'invalid' }
        expect(response).to render_template(:new)
        expect(flash[:notice]).to match(/^Email and password do not match/)
      end
    end
  end #create

  describe '#destroy' do
    context 'when logged in' do
      it 'deletes session and redirect to home' do
        test_sign_in(Factory(:user))
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

#   describe "invalid signin" do      
#     it "should rerender the new page" do
#       post  :create, :session => @attr
#       expect(response).to render_template('new')
#     end
#     it "should have the right title" do
#       post :create, :session => @attr
#       expect(response).should have_selector("title", content => "Sign In")
#     end
#     it "should have a flash.now message" do
#       post :create, :session => @attr
#       flash.now[:error].should =~ /invalid/i
#     end
#   end
#   describe "with valid email and password" do
#     before(:each) do
#       @user = Factory(:user)
#       @attr = { :email => @user.email, :password => @user.password }
#     end
#     it "should sign the user in" do
#       post :create, :session => @attr
#       expect(controller).current_user.should == @user
#       expect(controller).should be_signed_in
#     end
#     it "should redirect to the user show page" do
#       post :create, :session => @attr
#       response.should redirect_to(user_path(@user))
#     end
#   end
# end
