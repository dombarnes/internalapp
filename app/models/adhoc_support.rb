class AdhocSupport < ActiveRecord::Base
  attr_accessible :date, :job_type, :technicians, :notes, :company_id
  has_many :notes
  belongs_to :company
  
  validates :date, :presence => true
  validates :technicians, :presence => true
  validates :company_id, :presence => true
  validates :job_type, :presence => true
  validates :notes, :presence => true
  
  scope :all, order('adhoc_supports.date DESC')
end
