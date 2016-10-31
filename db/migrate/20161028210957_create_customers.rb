class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers, id: false do |t|
      t.string :id, :primary_key => true
      t.datetime :time_created
      t.datetime :time_modified
      t.string :edit_sequence
      t.string :name
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
      t.string :ship_address_block_addr1
      t.string :ship_address_block_addr2
      t.string :ship_address_block_addr3
      t.string :ship_address_block_addr4
      t.string :ship_address_block_addr5
      t.string :ship_address_city
      t.string :ship_address_state
      t.string :ship_address_postal_code
      t.string :ship_address_country
      t.string :ship_address_note
      t.string :ship_to_address_name
      t.string :ship_to_address_addr1
      t.string :ship_to_address_addr2
      t.string :ship_to_address_addr3
      t.string :ship_to_address_addr4
      t.string :ship_to_address_addr5
      t.string :ship_to_address_city
      t.string :ship_to_address_state
      t.string :ship_to_address_postal_code
      t.string :ship_to_address_country
      t.string :ship_to_address_note
      t.boolean :ship_to_address_default_ship_to
      t.string :phone
      t.string :alt_phone
      t.string :fax
      t.string :email
      t.string :cc
      t.string :contact
      t.string :alt_contact
      t.string :additional_contact_ref_contact_name
      t.string :additional_contact_ref_contact_value
      t.string :contacts_ret_list_id
      t.string :customer_type_id
      t.string :terms_id
      t.string :sales_rep_id
      t.decimal :balance, precision: 15, scale: 2
      t.decimal :total_balance, precision: 15, scale: 2
      t.string :sales_tax_code_id
      t.string :item_sales_tax_id
      t.string :resale_number
      t.string :account_number
      t.decimal :credit_limit, precision: 15, scale: 2
      t.string :preferred_payment_method_id
      t.string :credit_card_info_credit_card_number
      t.integer :credit_card_info_expiration_month
      t.integer :credit_card_info_expiration_year
      t.string :credit_card_info_name_on_card
      t.string :credit_card_info_credit_card_address
      t.string :credit_card_info_credit_card_postal_code
      t.string :job_status
      t.date :job_start_date
      t.date :job_projected_end_date
      t.date :job_end_date
      t.string :job_desc
      t.string :job_type_id
      t.text :notes
      t.string :additional_notes_ret_note_id
      t.string :preferred_delivery_method
      t.string :price_level_id
      t.string :external_guid
      t.string :currency_id
      t.string :data_ext_ret_owner_id

      t.timestamps
    end
    add_index :customers, :parent_id
  end
end
