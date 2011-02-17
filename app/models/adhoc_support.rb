# == Schema Information
# Schema version: 20110207183413
#
# Table name: adhoc_supports
#
#  id          :integer         not null, primary key
#  date        :date
#  type        :string(255)
#  technicians :integer
#  client_id   :integer
#  notes       :text
#  created_at  :datetime
#  updated_at  :datetime
#

class AdhocSupport < ActiveRecord::Base
  belongs_to :clients
  cattr_reader :per_page
  @@per_page = 15
end
