class IosQuote < ActiveRecord::Base
  attr_accessible :customer, :user_id, :device_quantity, :mobile_config, :install_required, :support_required, :install_cost, :decimal, :support_cost, :ios_values_id, :quote_status
#  filter_resource_access # Declarative Authorization
  using_access_control
  
  belongs_to :user
  has_many :ios_values

  validate :customer, :presence => true
  validate :device_quantity, :presence => true
  scope :recent, order('ios_quotes.created_at DESC')
  
  scope :current_user_only, where(:user_id => "current_user.id")
  scope :pending_items, where(:quote_status => 'Pending')
  scope :lost_items, where(:quote_status => 'Lost')
  scope :won_items, where(:quote_status => 'Won')
 
#  FILTERS = [
#    {:scope => "current_user_only",   :label => "Current User"},
#    {:scope => "pending_items",   :label => "Pending Quotes"},
#    {:scope => "lost_items",   :label => "Lost Quotes"},
#    {:scope => "won_items",   :label => "Won Quotes"},
#]            

  def self.most_recentfive
    all(:order => 'id DESC', :limit => 5)
  end

end
