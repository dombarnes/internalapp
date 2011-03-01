class Company < ActiveRecord::Base
  attr_accessible :company_name, :address_1, :address_2, :city, :county, :postcode, :website, :telephone_number
  has_many :clients
  
  default_scope :order => 'companies.company_name ASC'
end
