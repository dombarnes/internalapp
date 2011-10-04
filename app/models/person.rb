class Person < ActiveRecord::Base
  attr_accessible :title, :first_name, :last_name, :position, :telephone_number, :mobile_number, :email_address
  belongs_to :company
#  scope :all, order('person.last_name ASC')

end
