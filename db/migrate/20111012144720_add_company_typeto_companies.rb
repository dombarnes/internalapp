class AddCompanyTypetoCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :company_type, :string
  end

  def down
    remove_column :company, :company_type, :string
  end
end
