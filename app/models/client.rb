class Client < ActiveRecord::Base
  attr_accessible :client_name, :title, :first_name, :last_name, :address_1, :address_2, :city, :county, :postcode, :position, :telephone_number, :mobile_number, :source, :email_address
  has_many :adhoc_supports
  belongs_to :companies
  scope :all, order('clients.client_name ASC')
end
