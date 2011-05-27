class Role < ActiveRecord::Base
  has_many :roles_users
  has_many :roles, :through => :users
end
