class UpdatePersonFields < ActiveRecord::Migration
  def up
    add_column :people, :address_1, :string
    add_column :people, :address_2, :string
    add_column :people, :im, :string
    add_column :people, :linkedin, :string
    add_column :people, :twitter, :string
    rename_column :people, :info, :bio
    remove_column :people, :address
  end

  def down
  end
end
