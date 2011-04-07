class IosQuote < ActiveRecord::Base
  attr_accessible :support_required, :install_required, :mobile_config, :customer, :device_quantity
  
  belongs_to :clients
  belongs_to :user
  has_many :ios_values

  validate :customer, :presence => true
  validate :device_quantity, :presence => true
end
