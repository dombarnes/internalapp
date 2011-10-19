class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :quantity, :null => false
      t.string :unit_type, :null => false
      t.string :details
      t.decimal :unit_price, :null => false
      t.decimal :tax_rate, :null => false
      t.integer :invoice_id, :null => false
      
      t.timestamps
    end
  end
end
