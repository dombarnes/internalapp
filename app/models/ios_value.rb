class IosValue < ActiveRecord::Base
  attr_accessible :all
  
  has_many :ios_quotes
  scope :recent, order('created_at ASC')

end