require 'rails_helper'

Rspec.describe AdhocSupportsController do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AdhocSupportsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "assigns @adhoc_supports" do 
      get :index
      expect(assigns(:adhoc_supports)).to eq([adhoc_supports])
    end
    
  end
end
