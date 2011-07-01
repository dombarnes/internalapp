class IosQuote < ActiveRecord::Base
  attr_accessible :customer, :user_id, :device_quantity, :mobile_config, :install_required, :support_required, :install_cost, :decimal, :support_cost, :ios_values_id, :quote_status
#  filter_resource_access # Declarative Authorization
  
  belongs_to :user
  has_many :ios_values

  validate :customer, :presence => true
  validate :device_quantity, :presence => true
  scope :recent, order('ios_quotes.created_at DESC')
  
  named_scope :current_user_only, :conditions => [ :user_id => current_user.id]
  named_scope :pending_items, :conditions => { :quote_status => "pending"}
  named_scope :lost_items, :conditions => { :quote_status => "lost"}
  named_scope :won_items, :conditions => { :quote_status => "won"}
  FILTERS = [
    {:scope => "current_user_only",   :label => "Current User"},
    {:scope => "pending_items",   :label => "Pending Quotes"},
    {:scope => "lost_items",   :label => "Lost Quotes"},
    {:scope => "won_items",   :label => "Won Quotes"},
            ]

  def self.most_recentfive
    all(:order => 'id DESC', :limit => 5)
  end

end
