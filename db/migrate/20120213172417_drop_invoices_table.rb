class DropInvoicesTable < ActiveRecord::Migration
  def up
    drop_table :invoices
    drop_table :invoice_items
  end

  def down
  end
end
