class CreateCompanyTypes < ActiveRecord::Migration
  def change
    create_table :company_types do |t|
      t.string :company_type

      t.timestamps
    end
  end
end
