class InvoiceItem < ActiveRecord::Base
  validate :quantity, :unit_price, :presence => true
  validate :unit_price, :numericality => { :greater_than_or_equal_to => 0 }
  validate :quantity, :numericality => { :greater_than => 0 }
  # validate :discount, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}
  validate :invoice_id, :presence => true, :unless => :nested
  attr_accessible :quantity, :unit_type, :unit_price, :details, :tax_rate
  # scope :all, order('due_date ASC')
  attr_accessor :nested
  belongs_to :invoice
  
  def total_price
    self.unit_cost * self.quantity / 100.0
  rescue NoMethodError => method
    0
  end

end