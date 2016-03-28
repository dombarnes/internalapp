class Note < ActiveRecord::Base
  belongs_to :company
  belongs_to :person
  belongs_to :contracts
  belongs_to :adhoc_supports
end
