class AdhocSupport < ActiveRecord::Base
  has_many :notes
  belongs_to :company

  validates :date, :presence => true
  validates :technicians, :presence => true
  validates :company_id, :presence => true
  validates :job_type, :presence => true
  validates :notes, :presence => true

  default_scope { order('date DESC') }
end
