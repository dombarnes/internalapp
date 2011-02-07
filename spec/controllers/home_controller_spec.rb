require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
end

describe ClientsController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'clients'
      response.should be_success
    end
  end
end

describe AdhocSupportsController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'adhoc_supports'
      response.should be_success
    end
  end
end
