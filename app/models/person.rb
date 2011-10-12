class Person < ActiveRecord::Base
  attr_accessible :company_id, :title, :first_name, :last_name, :position, :telephone_number, :mobile_number, :email_address, :address_1, :address_2, :city, :county, :postcode, :im, :linkedin, :twitter
  belongs_to :company
  has_many :tasks
  
  scope :all, order('people.last_name ASC')

end
