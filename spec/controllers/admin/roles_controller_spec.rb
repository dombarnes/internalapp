require 'rails_helper'

RSpec.describe Admin::RolesController do

  describe "#index'" do
    it "should be successful" do
      get 'index'
      response.to be[:success]
    end
  end

end
