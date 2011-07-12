class ChangeIosQuotesWonToString < ActiveRecord::Migration
  def self.up
    rename_column :ios_quotes, :won, :quote_status
    rename_column :mac_quotes, :won, :quote_status
    change_column :ios_quotes, :quote_status, :string
    change_column :mac_quotes, :quote_status, :string
  end

  def self.down
    change_column :ios_quotes, :quote_status, :boolean
    change_column :mac_quotes, :quote_status, :boolean  
    rename_column :ios_quotes, :quote_status, :won
    rename_column :mac_quotes, :quote_status, :won
  end
end
