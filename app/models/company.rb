class Company < ActiveRecord::Base
  attr_accessible :company_name, :address_1, :address_2, :city, :county, :postcode, :website, :telephone_number, :source, :company_type_id
  validate :company_name, :presence => true

  has_many :people
  has_many :notes
  has_many :invoices
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
