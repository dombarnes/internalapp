class CreateAdhocSupports < ActiveRecord::Migration
  def self.up
    create_table :adhoc_supports do |t|
      t.date :date,             :null => false
      t.string :job_type,       :null => false
      t.integer :technicians,   :null => false
      t.integer :company_id,    :null => false
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :adhoc_supports
  end
end
