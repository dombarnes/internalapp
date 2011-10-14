class Note < ActiveRecord::Base
  belongs_to :companies, :people, :contracts, :adhoc_supports
end
