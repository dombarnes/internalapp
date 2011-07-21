class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments
  
  validates :name, :uniqueness => true
  validates :name, :presence => true
end
