class Company < ActiveRecord::Base
  attr_accessible :company_name, :address_1, :address_2, :city, :county, :postcode, :website, :telephone_number, :source, :company_type

  validates :company_name, :presence => true
  validates :company_type, :presence => true

  has_many :people
  has_many :notes
  has_many :adhoc_supports

  default_scope { order('company_name ASC') }
  scope :resellers, Company.where(:company_type => "Reseller")

  SOURCE_TYPE = ["Direct"]
  COMPANY_TYPE = ["Reseller", "School", "Limited Company", "Public Sector", "PLC", "Charity", "Freelancer" ]

  def to_param
      "#{id}-#{permalink}"
  end

  def self.search(search, sort_column, sort_direction)
    if search
      self.where('company_name LIKE ?', "%#{search}%")
    else
      self.all.order("#{sort_column} #{sort_direction}")
    end
  end

end
