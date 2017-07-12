class CreateInvoicePaymentJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :invoices, :receive_payments do |t|
      # t.index [:invoice_id, :receive_payment_id]
      t.index [:receive_payment_id, :invoice_id], unique: true, name: 'invoice_payment'
    end
  end
end
