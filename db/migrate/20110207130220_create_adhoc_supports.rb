class CreateAdhocSupports < ActiveRecord::Migration
  def self.up
    create_table :adhoc_supports do |t|
      t.date :date
      t.string :job_type
      t.integer :technicians
      t.integer :client_id
      t.text :notes

      t.timestamps
    end
    add_index :adhoc_supports, :client_id
  end

  def self.down
    drop_table :adhoc_supports
  end
end
