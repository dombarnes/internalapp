class MacQuote < ActiveRecord::Base
  attr_accessible :all
# =>   filter_resource_access # Declarative Authorization  

  belongs_to :user
  has_many :mac_values
  
  validate :customer_name, :presence => true

  scope :recent, order('mac_quotes.created_at DESC')

  def self.most_recentfive
    all(:order => 'id DESC', :limit=>5)
  end

end
