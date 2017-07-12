class ChangeLineItemIds < ActiveRecord::Migration[5.0]
  def change
    remove_column :estimate_lines, :id
    remove_column :sales_order_lines, :id
    remove_column :purchase_order_lines, :id
    remove_column :invoice_lines, :id
    add_column :estimate_lines, :id, :primary_key
    add_column :sales_order_lines, :id, :primary_key
    add_column :purchase_order_lines, :id, :primary_key
    add_column :invoice_lines, :id, :primary_key
    add_column :estimate_lines, :txn_line_id, :string
    add_column :sales_order_lines, :txn_line_id, :string
    add_column :purchase_order_lines,:txn_line_id, :string
    add_column :invoice_lines, :txn_line_id, :string
    add_index :estimate_lines, :txn_line_id, unique: true
    add_index :sales_order_lines, :txn_line_id, unique: true
    add_index :purchase_order_lines, :txn_line_id, unique: true
    add_index :invoice_lines, :txn_line_id, unique: true
  end
end
