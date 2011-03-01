class RenameTelephonInClients < ActiveRecord::Migration
  def self.up
    rename_column  :clients, :telephon_number, :telephone_number
  end

  def self.down
  end
end
