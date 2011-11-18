class Company < ActiveRecord::Base
  attr_accessible :company_name, :address_1, :address_2, :city, :county, :postcode, :website, :telephone_number, :source, :company_type

  validates :company_name, :presence => true
  validates :company_type, :presence => true
  
  has_many :people
  has_many :notes
  has_many :invoices
  has_many :adhoc_supports
  
  scope :all, order('companies.company_name ASC')
  
  SOURCE_TYPE = ["Direct"]
  COMPANY_TYPE = ["Reseller", "School", "Limited Company", "Public Sector", "PLC", "Charity", "Freelancer" ]
  
#scopes  
  scope :resellers, Company.where(:company_type => "Reseller")
  
  
  def self.search(search)
    if search
      where('company_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
