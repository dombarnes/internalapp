class CreateMacQuotes < ActiveRecord::Migration
  def self.up
    create_table :mac_quotes do |t|
      t.string    :customer_name
      t.integer   :client_quantity
      t.integer   :server_quantity
      t.integer   :new_user_setup
      t.boolean   :ad_integration
      t.boolean   :deploy_studio_setup
      t.decimal   :airport_setup
      t.decimal   :print_server
      t.boolean   :iwork
      t.boolean   :office
      t.boolean   :fce
      t.boolean   :fcp
      t.boolean   :ard
      t.boolean   :logicx
      t.boolean   :logicp
      t.boolean   :cs5
      t.boolean   :aperture
      t.decimal   :install_cost
      t.decimal   :support_cost
      t.integer   :mac_values_id
      t.integer :user_id
      t.timestamps
    end
    add_index :mac_quotes, :user_id
    add_index :mac_quotes, :mac_values_id
  end

  def self.down
    drop_table :mac_quotes
  end
end
