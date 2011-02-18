require 'spec_helper'

describe ClientsController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'clients'
      response.should be_success
    end
  end
end
