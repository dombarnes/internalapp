class Company < ActiveRecord::Base
  attr_accessible :company_name, :address_1, :address_2, :city, :county, :postcode, :website, :telephone_number
  has_many :clients
  has_many :adhoc_supports
  scope :all, order('companies.company_name ASC')
  
  def self.search(search)
    if search
      where('company_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
