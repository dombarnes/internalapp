class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :client_name
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :position
      t.integer :telephone_number
      t.integer :mobile_number
      t.string :email_address
      t.string :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
