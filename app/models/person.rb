class Person < ActiveRecord::Base
  attr_accessible :company_id, :title, :first_name, :last_name, :position, :telephone_number, :mobile_number, :email_address, :address_1, :address_2, :city, :county, :postcode, :im, :linkedin, :twitter

  belongs_to :company
  has_many :notes
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, :company_id, :presence => true
  
  validates :email_address, presence: true, length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  
  default_scope -> { order('last_name ASC') }
#  scope :staff_members, where('user.role = ?', 'admin', 'staff')

  # def to_param
  #     "#{id}-#{permalink}"
  # end

  def full_name
    [first_name, last_name].join(' ')
  end
end
