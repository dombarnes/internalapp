class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :person do |t|
      t.string :title
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :telephone_number
      t.string :mobile_number
      t.string :email_address
      t.string :website
      t.text   :address
      t.string :city
      t.string :county
      t.string :postcode
      t.string :company_id
      t.text   :info

      t.timestamps
    end
  end

  def self.down
    drop_table :person
  end
end
