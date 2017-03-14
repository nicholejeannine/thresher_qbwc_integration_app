class CreateReceivePayment < ActiveRecord::Migration[5.0]
  def change
    create_table :receive_payments, id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.datetime :time_created
      t.datetime :time_modified
      t.string :edit_sequence
      t.integer :txn_number
      t.string :customer_id
      t.string :customer_full_name
      t.string :ar_account_id
      t.string :ar_account_full_name
      t.date :txn_date
      t.string :ref_number
      t.decimal :total_amount
      t.string :payment_method_id
      t.string :payment_method_full_name
      t.text :memo
      t.decimal :unused_payment
      t.decimal :unused_credits
      t.string :applied_to_txn_ret
    end
  end
end
