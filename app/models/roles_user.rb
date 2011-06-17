class RolesUser < ActiveRecord::Base
  attr_accessible :all
  belongs_to :user
  belongs_to :role
  
end
