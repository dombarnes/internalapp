class IosQuote < ActiveRecord::Base
  attr_accessible :customer, :user_id, :device_quantity, :install_required, :support_required, :install_cost, :support_cost, :mobile_config, :ios_values_id, :status
#  filter_resource_access # Declarative Authorization
  using_access_control

  belongs_to :user
  has_one :ios_value

  validates :customer, :presence => true
  validates :device_quantity, :presence => true

  scope :recent, -> { order('created_at DESC') }
  scope :owned, -> { where('user_id = ?', 'current_user.id' ) }
  scope :current_user_only, -> { where('user_id = ?', 'current_user.id') }
  scope :pending_items, -> { where(:quote_status => 'Pending') }
  scope :lost_items, -> { where(:quote_status => 'Lost')}
  scope :won_items, -> { where(:quote_status => 'Won')}

  STATUS_TYPES = ["Won", "Pending", "Lost"]

  def self.most_recentfive
    order('id DESC').limit(5)
  end

  def self.recent
    order('created_at DESC')
  end

end
