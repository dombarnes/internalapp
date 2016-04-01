require 'rails_helper'

RSpec.describe AdhocSupportsController, type: :controller do
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
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      expect(response).to be_success
    end
  end

end
