class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :invoice_date, :null => false
      t.string :purchase_order
      t.date :date_sent
      t.boolean :paid
      t.date :date_paid
      t.decimal :sub_total
      t.decimal :vat_rate
      t.decimal :vat_total
      t.decimal :discount_total
      t.decimal :total
      t.integer :company_id, :null => false
      t.string :status, :null => false

      t.timestamps
    end
  end
end
