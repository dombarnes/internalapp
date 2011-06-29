class ChangeClientTelephoneToString < ActiveRecord::Migration
  def self.up
    change_column :clients, :mobile_number, :string
    change_column :clients, :telephone_number, :string
  end

  def self.down
    change_column :clients, :mobile_number, :integer
    change_column :clients, :telephone_number, :integer
  end
end
