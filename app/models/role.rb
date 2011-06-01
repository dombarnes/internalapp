class Role < ActiveRecord::Base
  has_many :roles_users
  has_many :users, :through => :roles_users
  
#  def to_s
#    self.name    
#  end
end
