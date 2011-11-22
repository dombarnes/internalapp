class AddPermalinkToCompany < ActiveRecord::Migration
  def up
    change_table :companies do |t|
      t.string :permalink
    end
  end
  
  def down  
    remove_column :company, :permalink
  end
end
