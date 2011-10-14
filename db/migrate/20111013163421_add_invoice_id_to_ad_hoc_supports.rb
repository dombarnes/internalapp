class AddInvoiceIdToAdHocSupports < ActiveRecord::Migration
  def up
    add_column :adhoc_supports, :invoice_id, :integer
    add_index :adhoc_supports, :invoice_id
  end

  def down
    remove_column :adhoc_supports, :invoice_id
  end
end
