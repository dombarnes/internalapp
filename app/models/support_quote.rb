class SupportQuote < ActiveRecord::Base
  attr_accessible :customer_name
  
  belongs_to :user
  validates :customer_name, :presence => true
  validates :user_id, :presence => true
  
  scope :recent, order('created_at DESC')
end
