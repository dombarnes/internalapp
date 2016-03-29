class IosValue < ActiveRecord::Base

  validates_presence_of :daily_rate, :iosdevice_support_cost, :iosdevice_install_time, :iosdevice_install_setup

  has_many :ios_quotes
  # scope :recent, order('created_at ASC')
end
