class IosQuote < ActiveRecord::Base
  belongs_to :user
  has_one :ios_value

  validates :customer, :presence => true
  validates :device_quantity, :presence => true

  scope :recent, -> { order('created_at DESC') }
  scope :pending_items, -> { where(:quote_status => 'Pending') }
  scope :lost_items, -> { where(:quote_status => 'Lost')}
  scope :won_items, -> { where(:quote_status => 'Won')}

  STATUS_TYPES = ["Won", "Pending", "Lost"]

  def self.most_recentfive
    order('id DESC').limit(5)
  end

  def self.owned
    where(user: @current_user)
  end
end
