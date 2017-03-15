class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients, id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.datetime :time_created
      t.datetime :time_modified
      t.string :edit_sequence, limit: 16
      t.string :full_name, limit: 209
      t.boolean :is_active, null: false, default: true
      t.string :company_name, limit: 41
      t.string :customer_type, limit: 159
      t.string :terms, limit: 31
      t.string :sales_rep, limit: 5
      t.decimal :total_balance, precision: 20, scale: 5
      t.string :sales_tax_code, limit: 3
      t.string :item_sales_tax, limit: 31
      t.string :account_number, limit: 99
      t.string :preferred_delivery_method, limit: 41
    end
    add_index :clients, :full_name, unique: true
    add_index :clients, :is_active
  end
end
