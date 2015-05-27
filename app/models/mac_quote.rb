class MacQuote < ActiveRecord::Base
  attr_accessible :all
# =>   filter_resource_access # Declarative Authorization

  belongs_to :user
  has_many :mac_values

  validates :customer_name, :presence => true

  # scope :recent. -> { order('mac_quotes.created_at DESC') }
  # scope :most_recentfive, -> { order('mac_quotes.id DESC').limit => 5}
  scope :owned, -> { where user_id: current_user.id }

  def self.most_recentfive
    order('id DESC').limit(5)
  end

  def self.recent
    order('created_at DESC')
  end

end
