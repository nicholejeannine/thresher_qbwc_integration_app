class CreateEstimates < ActiveRecord::Migration[5.0]
  def change
    create_table :estimates, id: false do |t|
      t.string :id, :primary_key => true
      t.datetime :time_created
      t.datetime :time_modified
      t.string :edit_sequence
      t.integer :txn_number
      t.string :customer_id
      t.string :class_id
      t.string :template_id
      t.date :txn_date
      t.string :ref_number
      t.string :bill_address_addr1
      t.string :bill_address_addr2
      t.string :bill_address_addr3
      t.string :bill_address_addr4
      t.string :bill_address_addr5
      t.string :bill_address_city
      t.string :bill_address_state
      t.string :bill_address_postal_code
      t.string :bill_address_country
      t.string :bill_address_note
      t.string :bill_address_block_addr1
      t.string :bill_address_block_addr2
      t.string :bill_address_block_addr3
      t.string :bill_address_block_addr4
      t.string :bill_address_block_addr5
      t.string :ship_address_addr1
      t.string :ship_address_addr2
      t.string :ship_address_addr3
      t.string :ship_address_addr4
      t.string :ship_address_addr5
      t.string :ship_address_city
      t.string :ship_address_state
      t.string :ship_address_postal_code
      t.string :ship_address_country
      t.string :ship_address_note
      t.string :ship_address_block_addr1
      t.string :ship_address_block_addr2
      t.string :ship_address_block_addr3
      t.string :ship_address_block_addr4
      t.string :ship_address_block_addr5
      t.boolean :is_active, :null => false, :default => true
      t.string :po_number
      t.string :terms_id
      t.date :due_date
      t.string :sales_rep_id
      t.string :fob
      t.decimal :subtotal, precision: 15, scale: 2
      t.string :item_sales_tax_id
      t.float :sales_tax_percentage
      t.decimal :sales_tax_total, precision: 15, scale: 2
      t.decimal :total_amount, precision: 15, scale: 2
      t.string :currency_id
      t.float :exchange_rate
      t.decimal :total_amount_in_home_currency, precision: 15, scale: 2
      t.text :memo
      t.string :customer_msg_id
      t.boolean :is_to_be_emailed
      t.string :customer_sales_tax_code_id
      t.string :other
      t.string :external_guid
      t.string :linked_txn_id

      t.timestamps
    end
    # add_index :estimates, :txn_id, unique: true
  end
end
