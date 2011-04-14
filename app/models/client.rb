# == Schema Information
# Schema version: 20110207183413
#
# Table name: clients
#
#  id              :integer         not null, primary key
#  client_name     :string(255)
#  title           :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  address_1       :string(255)
#  address_2       :string(255)
#  city            :string(255)
#  county          :string(255)
#  postcode        :string(255)
#  position        :string(255)
#  telephone_number :integer
#  mobile_number   :integer
#  source          :string(255)
#  email_address   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Client < ActiveRecord::Base
  attr_accessible :client_name, :title, :first_name, :last_name, :address_1, :address_2, :city, :county, :postcode, :position, :telephone_number, :mobile_number, :source, :email_address
  has_many :adhoc_supports
  belongs_to :companies
  scope :all, order('clients.client_name ASC')
end
