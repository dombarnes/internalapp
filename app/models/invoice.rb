class Invoice < ActiveRecord::Base
  attr_accessible :invoice_date, :company_id, :purchase_order, :vat_rate, :date_sent, :paid, :date_paid 
  validate :invoice_date, :company_id, :vat_rate, :date_sent, :presence => true
  validate :status, :inclusion => { :in => ['draft', 'sent', 'paid'] }
  
  belongs_to :company
  has_many :items, :class_name => :invoice_items, :dependent => :destroy
  accepts_nested_attributes_for :items, :allow_destroy => true
  
  scope :outstanding, where(:paid => "false")
  scope :overdue, lambda { where('date_sent < ?', Date.today - 30.days)}
  scope :recently_paid, lambda { where('date_paid < ?', Date.today - 14.days)}
end
