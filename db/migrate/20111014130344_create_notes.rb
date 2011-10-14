class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :company_id
      t.integer :people_id
      t.integer :contract_id
      t.integer :adhoc_supports_id
      t.text :notes

      t.timestamps
    end
  end
end
