class IosQuote < ActiveRecord::Base
  attr_accessible :support_required, :install_required, :mobile_config, :customer, :device_quantity, :ios_values_id
  
  belongs_to :user
  has_many :ios_values

  validate :customer, :presence => true
  validate :device_quantity, :presence => true
  scope :recent, order('created_at DESC')
  
  def self.most_recentfive
    all(:order => 'id DESC', :limit => 5)
  end

end
