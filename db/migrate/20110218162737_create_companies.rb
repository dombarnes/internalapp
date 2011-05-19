class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :company_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :county
      t.string :postcode
      t.string :telephone_number
      t.string :website

      t.timestamps
    end
    change_table :clients do|t|
      t.remove :address_1
      t.remove :address_2
      t.remove :city
      t.remove :county
      t.remove :postcode
      t.integer :company_id
    end
    add_index :clients, :company_id
  end

  def self.down
    drop_table :companies
  end
end
