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
#  telephon_number :integer
#  mobile_number   :integer
#  source          :string(255)
#  email_address   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Client < ActiveRecord::Base
  has_many :adhoc_supports
  cattr_reader :per_page
  @@per_page = 15
end
