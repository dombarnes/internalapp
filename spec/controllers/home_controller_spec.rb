require 'rails_helper'

RSpec.describe HomeController, type: :controller  do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      expect(response).to be_success
    end
  end

end
