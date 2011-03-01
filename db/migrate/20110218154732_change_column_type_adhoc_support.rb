class ChangeColumnTypeAdhocSupport < ActiveRecord::Migration
  def self.up
    rename_column  :adhoc_supports, :type, :job_type
  end

  def self.down
  end
end
