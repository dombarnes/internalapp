class AdminController < ApplicationController
  filter_resource_access
  before_filter :require_user
end
