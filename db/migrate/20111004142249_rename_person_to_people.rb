class RenamePersonToPeople < ActiveRecord::Migration
  def self.up
    rename_table :person, :people
  end

  def self.down
    rename_table :people, :person
  end
end
