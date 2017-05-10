class CreateTxnLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :txn_links do |t|
      t.string :parent_id, :null => false
      t.string :parent_type, :null => false
      t.string :txn_id, :null => false
      t.string :txn_type, :null => false
      t.date :txn_date
      t.string :ref_number
      t.string :link_type
      t.decimal :amount, precision: 20, scale: 5
    end
  end
end
