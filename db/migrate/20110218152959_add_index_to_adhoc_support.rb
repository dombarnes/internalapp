class AddIndexToAdhocSupport < ActiveRecord::Migration
  def self.up
    add_index :adhoc_supports, :client_id
  end

  def self.down
  end
end
