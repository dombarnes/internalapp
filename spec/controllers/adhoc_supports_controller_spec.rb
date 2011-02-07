require 'spec_helper'

describe AdhocSupportsController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'adhoc_supports'
      response.should be_success
    end
  end
end
