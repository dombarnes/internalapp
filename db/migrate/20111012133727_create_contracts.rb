class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.date :start_date
      t.date :end_date
      t.string :contract_type
      t.decimal :cost
      t.string :contract_state

      t.timestamps
    end
  end
end
