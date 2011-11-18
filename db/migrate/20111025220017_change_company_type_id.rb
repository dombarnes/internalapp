class ChangeCompanyTypeId < ActiveRecord::Migration
  def up
    change_table :companies do |t|
      t.rename :company_type_id, :company_type
      t.change :company_type, :string
    end
  end

  def down
    rename_column :companies, :company_type, :company_type_id
    change_column :companies, :company_type, :integer
  end
end
