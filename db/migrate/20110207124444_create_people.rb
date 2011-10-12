class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string    :title
      t.string    :first_name,         :null => false
      t.string    :last_name,          :null => false
      t.string    :position
      t.string    :telephone_number
      t.string    :mobile_number
      t.string    :email_address,     :null => false
      t.string    :website
      t.string    :address_1
      t.string    :address_2
      t.string    :city
      t.string    :county
      t.string    :postcode
      t.integer   :company_id,        :null => false
      t.text      :bio
      t.string    :im
      t.string    :linkedin
      t.string    :twitter
      t.string    :customer_id
      t.string    :referred_by
      
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
