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
      t.boolean :is_to_be_emailed, :null => false, :default => false
      t.boolean :is_tax_included, :null => false, :default => false
      t.string :customer_sales_tax_code_id
      t.string :other
      t.string :external_guid
      t.string :linked_txn
      t.string :estimate_line_id
      t.string :estimate_line_group_id
      t.string :data_ext_id

      t.timestamps null: false
    end

     create_table :estimate_lines, id: false do |t|
      t.string :id, :primary_key => true
      t.string :item_id
      t.string :desc
      t.string :quantity
      t.string :unit_of_measure
      t.string :override_uom_set_id
      t.string :rate
      t.float :rate_percent
      t.string :class_id
      t.decimal :amount, precision: 15, scale: 2
      t.decimal :tax_amount, precision: 15, scale: 2
      t.string :inventory_site_id
      t.string :inventory_site_location_id
      t.string :sales_tax_code_id
      t.string :markup_rate
      t.float :markup_rate_percent
      t.string :other1
      t.string :other2
      t.string :data_ext_id

      t.timestamps null: false
    end

    create_table :estimate_line_groups, id: false do |t|
      t.string :id, :primary_key => true
      t.string :item_group_id
      t.string :desc
      t.string :quantity
      t.string :unit_of_measure
      t.string :override_uom_set_id
      t.boolean :is_print_items_in_group
      t.decimal :total_amount, precision: 15, scale: 2
      t.string :estimate_line_id
      t.string :data_ext_id

      t.timestamps null: false
    end

    # lookups
   create_table :templates, id: false do |t|
      t.string :id, :primary_key => true
      t.datetime :time_created
      t.datetime :time_modified
      t.string :edit_sequence
      t.string :name
      t.boolean :is_active, :null => false, :default => true
      t.string :template_type

      t.timestamps null: false
    end

    create_table :currencies, id: false do |t|
      t.string :id, :primary_key => true
      t.datetime :time_created
      t.datetime :time_modified
      t.string :edit_sequence
      t.string :name
      t.boolean :is_active, :null => false, :default => true
      t.string :currency_code
      t.string :currency_format
      t.boolean :is_user_defined_currency
      t.float :exchange_rate
      t.date :as_of_date

      t.timestamps null: false
  end

  create_table :inventory_sites, id: false do |t|
      t.string :id, :primary_key => true
      t.datetime :time_created
      t.datetime :time_modified
      t.string :edit_sequence
      t.string :name
      t.boolean :is_active, :null => false, :default => true
      t.string :parent_site_id
      t.boolean :is_default_site
      t.string :site_desc
      t.string :contact
      t.string :phone
      t.string :fax
      t.string :email
      t.text :site_address

      t.timestamps null: false
    end
  end
end