class Role < ActiveRecord::Base
  attr_accessible :all
  has_many :roles_users
  has_many :users, :through => :roles_users  

end
