class MacQuote < ActiveRecord::Base
  belongs_to :user
  has_many :mac_values

  validates :customer_name, :presence => true

  scope :owned, -> { where user_id: current_user.id }
  scope :recent, -> { order('created_at DESC') }
  
  def self.most_recentfive
    order('id DESC').limit(5)
  end
end
