class AddWontoMacQuote < ActiveRecord::Migration
  def self.up
    add_column :mac_quotes, :won, :boolean
    add_column :ios_quotes, :won, :boolean
  end

  def self.down
    remove_column :mac_quotes, :won
    remove_colum :ios_quotes, :won
  end
end
