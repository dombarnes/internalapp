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
      t.string :source

      t.timestamps
    end
    add_index :clients, :company_id
    add_index :adhoc_supports, :company_id
  end

  def self.down
    drop_table :companies
  end
end
