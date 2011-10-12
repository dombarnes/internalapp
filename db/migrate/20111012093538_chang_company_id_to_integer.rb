class ChangCompanyIdToInteger < ActiveRecord::Migration
  def up
    change_column :people, :company_id, :integer
  end

  def down
    change_column :people, :company_id, :string
  end
end
