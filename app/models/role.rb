class Role < ActiveRecord::Base
  has_many :users, through: :role_users
  has_many :role_users
  # acts_as_authorization_role  
  validates :title, :uniqueness => true, :presence => true
end
