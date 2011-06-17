class IosQuote < ActiveRecord::Base
  attr_accessible :all
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
