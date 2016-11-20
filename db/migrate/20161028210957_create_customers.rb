class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers, id: false do |t|
      t.string :id, :primary_key => true
      t.datetime :time_created
      t.datetime :time_modified
      t.string :edit_sequence
      t.string :name, :null => false
      t.string :full_name, :unique => true
      t.boolean :is_active, :null => false, :default => true
      t.string :class_id
      t.string :parent_id
      t.integer :sublevel, :null => false, :default => 0
      t.string :company_name
      t.string :salutation
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :job_title
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
      t.string :print_as
      t.string :phone
      t.string :mobile
      t.string :pager
      t.string :alt_phone
      t.string :fax
      t.string :email
      t.string :cc
      t.string :contact
      t.string :alt_contact
      t.string :additional_contact_id
      t.string :contacts_id
      t.string :customer_type_id
      t.string :terms_id
      t.string :sales_rep_id
      t.decimal :balance, precision: 15, scale: 2
      t.decimal :total_balance, precision: 15, scale: 2
      t.string :sales_tax_code_id
      t.string :item_sales_tax_id
      t.string :sales_tax_country
      t.string :resale_number
      t.string :account_number
      t.decimal :credit_limit, precision: 15, scale: 2
      t.string :preferred_payment_method_id
      t.string :credit_card_info
      t.string :job_status
      t.date :job_start_date
      t.date :job_projected_end_date
      t.date :job_end_date
      t.string :job_desc
      t.string :job_type_id
      t.text :notes
      t.string :additional_notes_id
      t.boolean :is_statement_with_parent, :null => false, :default => false
      t.string :delivery_method
      t.string :preferred_delivery_method
      t.string :price_level_id
      t.string :external_guid
      t.string :tax_registration_number
      t.string :currency_id
      t.string :data_ext_id
      t.timestamps null: false
    end

  # Lookup tables
  create_table :classes, id: false do |t|
    t.string :id, :primary_key => true
    t.datetime :time_created
    t.datetime :time_modified
    t.string :edit_sequence
    t.string :name
    t.string :full_name
    t.boolean :is_active
    t.string :parent_ref_id
    t.integer :sublevel
    t.timestamps null: false
  end

  create_table :contacts, id: false do |t|
    t.string :id, :primary_key => true
    t.datetime :time_created
    t.datetime :time_modified
    t.string :edit_sequence
    t.string :contact
    t.string :salutation
    t.string :first_name
    t.string :middle_name
    t.string :last_name
    t.string :job_title
    t.string :additional_contact_id
    t.timestamps null: false
  end

  create_table :customer_types, id: false do |t|
    t.string :id, :primary_key => true
    t.datetime :time_created
    t.datetime :time_modified
    t.string :edit_sequence
    t.string :name
    t.string :full_name
    t.boolean :is_active, :null => false, :default => true
    t.string :parent_id
    t.integer :sublevel
    t.timestamps null: false
  end

  create_table :terms, id: false do |t|
    t.string :id, :primary_key => true
    t.string :full_name
    t.timestamps null: false
  end


  create_table :sales_reps,  id: false do |t|
    t.string :id, :primary_key => true
    t.datetime :time_created
    t.datetime :time_modified
    t.string :edit_sequence
    t.string :initial
    t.boolean :is_active, :null => false, :default => true
    t.string :sales_rep_entity_id
    t.timestamps null: false
  end


  create_table :sales_tax_codes, id: false do |t|
    t.string :id, :primary_key => true
    t.datetime :time_created
    t.datetime :time_modified
    t.string :edit_sequence
    t.string :name
    t.boolean :is_active, :null => false, :default => true
    t.boolean :is_taxable, :null => false, :default => true
    t.string :desc
    t.string :item_purchase_tax_id
    t.string :item_sales_tax_id
    t.timestamps null: false
  end

  create_table :item_sales_taxes, id: false do |t|
    t.string :id, :primary_key => true
    t.datetime :time_created
    t.datetime :time_modified
    t.string :edit_sequence
    t.string :name
    t.string :bar_code_value
    t.boolean :is_active, :null => false, :default => true
    t.string :class_id
    t.string :item_desc
    t.float :tax_rate, precision: 10, scale: 2
    t.string :tax_vendor_id
    t.string :external_guid
    t.string :data_ext_id
    t.timestamps null: false
  end

  create_table :preferred_payment_methods, id: false do |t|
    t.string :id, :primary_key => true
    t.string :full_name
    t.timestamps null: false
  end

  create_table :job_types, id: false do |t|
    t.string :id, :primary_key => true
    t.datetime :time_created
    t.datetime :time_modified
    t.string :edit_sequence
    t.string :name
    t.string :full_name
    t.boolean :is_active, :null => false, :default => true
    t.string :parent_id
    t.integer :sublevel, :null => false, :default => 0
    t.timestamps null: false
  end

  create_table :additional_notes, id: false do |t|
    t.string :id, :primary_key => true
    t.integer :note_id
    t.date :date
    t.string :note
    t.timestamps null: false
  end

  create_table :price_levels, id: false do |t|
    t.string :id, :primary_key => true
    t.datetime :time_created
    t.datetime :time_modified
    t.string :edit_sequence
    t.string :name
    t.boolean :is_active, :null => false, :default => true
    t.string :price_level_type
    t.float :price_level_fixed_percentage
    t.string :price_level_per_item_id
    t.string :currency_id
    t.timestamps null: false
  end


  create_table :data_exts, id: false do |t|
    t.string :id, :primary_key => true
    t.string :owner_id
    t.string :data_ext_name
    t.string :data_ext_type
    t.string :data_ext_value
    t.timestamps null: false
  end
end

end
