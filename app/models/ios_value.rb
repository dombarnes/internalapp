class IosValue < ActiveRecord::Base
  attr_accessible :daily_rate, :iosdevice_support_cost, :iosdevice_install_time, :iosdevice_install_setup
  validates_presence_of :daily_rate, :iosdevice_support_cost, :iosdevice_install_time, :iosdevice_install_setup
  has_many :ios_quotes
  scope :recent, order('created_at ASC')

end