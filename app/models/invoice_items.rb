class InvoiceItem < ActiveRecord::Base
  attr_accessible :quantity, :unit_type, :unit_price, :details, :vat_rate

  belongs_to :invoice  

  # scope :all, order('due_date ASC')
  
  validate :quantity, :unit_cost, :unit_price, :presence => true
  validate :unit_price, :numericality => { :greater_than_or_equal_to => 0 }
  validate :quantity, :numericality => { :greater_than => 0 }
  # validate :discount, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}
  validate :invoice_id, :presence => true, :unless => :nested
  attr_accessor :nested

end