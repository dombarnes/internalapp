class MacQuote < ActiveRecord::Base
  attr_accessible :all
  
  belongs_to :user
  validates :customer_name, :presence => true
  scope :all, order('mac_quotes.created_at DESC')

  def self.most_recentfive
      all(:order => 'id DESC', :limit=>5)
    end

end
