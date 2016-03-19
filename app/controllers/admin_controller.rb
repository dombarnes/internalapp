class AdminController < ApplicationController
  before_action :authenticate_user!
  filter_resource_access
end
