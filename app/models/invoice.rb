class Invoice < ActiveRecord::Base
  attr_accessible :invoice_date, :company_id, :purchase_order, :vat_rate, :date_sent, :paid, :date_paid 
  validates :invoice_date, :company_id, :vat_rate, :presence => true
  validates :status, :inclusion => { :in => ['Draft', 'Sent', 'Paid'] }
  
  belongs_to :company
  
  has_many :invoice_items, :through => :invoices, :dependent => :destroy # :class_name => :invoice_items,   accepts_nested_attributes_for :invoice_items, :reject_if => :all_blank, :allow_destroy => true
  
  scope :outstanding, where(:paid => "false")
  scope :overdue, lambda { where('date_sent < ?', Date.today - 30.days)}
  scope :recently_paid, lambda { where('date_paid < ?', Date.today - 14.days)}

  # def total  
  #     @total = 0
  #     self.items.each do |item|
  #       @total += item.total_price
  #     end
  #     
  #     @total
  #   end

end
