class RolesUser < ActiveRecord::Base
  has_many :users
  has_many :roles
end
