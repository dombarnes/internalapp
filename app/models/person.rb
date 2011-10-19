class Person < ActiveRecord::Base
  attr_accessible :company_id, :title, :first_name, :last_name, :position, :telephone_number, :mobile_number, :email_address, :address_1, :address_2, :city, :county, :postcode, :im, :linkedin, :twitter
  belongs_to :company
  has_many :tasks
  has_many :notes
  
  validates :first_name, :last_name, :company_id, :presence => true
  validates :email_address, :format => { :with => /^([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4})?$/, :message => 'must be valid email.' }
  
  scope :all, order('people.last_name ASC')
  scope :staff_members, where('user.role = ?', 'admin', 'staff')
end
