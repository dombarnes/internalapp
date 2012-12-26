class AdminController < ApplicationController
  before_filter :require_user
  filter_resource_access
end