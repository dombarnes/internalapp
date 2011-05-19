class InstallQuote < ActiveRecord::Base
  attr_accessible :customer_name
  
  belongs_to :user
  validates :customer_name, :presence => true
  scope :all, order('install_quotes.created_at DESC')
end
