# == Schema Information
# Schema version: 20110207183413
#
# Table name: adhoc_supports
#
#  id          :integer         not null, primary key
#  date        :date
#  job_type        :string(255)
#  technicians :integer
#  client_id   :integer
#  notes       :text
#  created_at  :datetime
#  updated_at  :datetime
#

class AdhocSupport < ActiveRecord::Base
  attr_accessible :date, :job_type, :technicians, :notes
  
  belongs_to :clients
  
  validates :date, :presence => true
  validates :technicians, :presence => true
  validates :client_id, :presence => true
  validates :job_type, :presence => true
  
  scope :all, order('adhoc_supports.date DESC')
end
