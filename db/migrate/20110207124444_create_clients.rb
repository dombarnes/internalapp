class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :client_name
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :county
      t.string :postcode
      t.string :position
      t.integer :telephone_number
      t.integer :mobile_number
      t.string :source
      t.string :email_address

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
