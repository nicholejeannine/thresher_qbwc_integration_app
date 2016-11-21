class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :txn_id
      t.datetime :time_created
      t.datetime :time_modified
      t.string :edit_sequence
      t.integer :txn_number
      t.string :customer_ref
      t.string :class_ref
      t.string :ar_account_ref
      t.string :template_ref
      t.date :txn_date
      t.string :ref_number
      t.string :bill_address
      t.string :bill_address_block
      t.string :ship_address
      t.string :ship_address_block
      t.boolean :is_pending
      t.boolean :is_finance_charge
      t.string :po_number
      t.string :terms_ref
      t.date :due_date
      t.string :sales_rep_ref
      t.string :fob
      t.date :ship_date
      t.string :ship_method_ref
      t.decimal :subtotal, precision: 15, scale: 2
      t.string :item_sales_tax_ref
      t.float :sales_tax_percentage
      t.decimal :sales_tax_total, precision: 15, scale: 2
      t.decimal :applied_amount, precision: 15, scale: 2
      t.decimal :balance_remaining, precision: 15, scale: 2
      t.string :currency_ref
      t.float :exchange_rate
      t.decimal :balance_remaining_in_home_currency, precision: 15, scale: 2
      t.text :memo
      t.boolean :is_paid
      t.string :customer_msg_ref
      t.boolean :is_to_be_printed
      t.boolean :is_to_be_emailed
      t.boolean :is_tax_included
      t.string :customer_sales_tax_code_ref
      t.decimal :suggested_discount_amount, precision: 15, scale: 2
      t.date :suggested_discount_date
      t.string :other
      t.string :external_guid
      t.string :linked_txn
      t.string :invoice_line_ret
      t.string :invoice_line_group_ret
      t.string :discount_line_ret
      t.string :sales_tax_line_ret
      t.string :shipping_line_ret
      t.string :data_ext_ret

      t.timestamps
    end
    add_index :invoices, :txn_id
  end
end
