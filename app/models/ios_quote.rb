class IosQuote < ActiveRecord::Base
  attr_accessible :customer, :user_id, :device_quantity, :mobile_config, :install_required, :support_required, :install_cost, :decimal, :support_cost, :ios_values_id
#  filter_resource_access # Declarative Authorization
  
  belongs_to :user
  has_many :ios_values

  validate :customer, :presence => true
  validate :device_quantity, :presence => true
  scope :recent, order('ios_quotes.created_at DESC')
  
  def self.most_recentfive
    all(:order => 'id DESC', :limit => 5)
  end

end
