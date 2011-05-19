class MacQuote < ActiveRecord::Base
  attr_accessible :customer_name
  
  belongs_to :user
  validates :customer_name, :presence => true
  scope :all, order('mac_quotes.created_at DESC')
end
