class ReceivePayment < ApplicationRecord
  has_many :invoices, through: :invoices_receive_payments
  def self.parse_linked_txn(ret, payment_id)
    begin
      ret.each do |hash|
      if hash["txn_type"] == "Invoice"
        txn_id = hash["txn_id"]
        invoice_id = Invoice.find_by("txn_id" => txn_id)&.id
        InvoicesReceivePayment.find_or_create_by({"invoice_id" => invoice_id, "receive_payment_id" => payment_id}) unless invoice_id.nil?
      end
    end
    rescue => e
      QbwcError.create(:worker_class => "Parse Linked Txn Payment", :model_id => "#{payment_id}", :error_message => "Error saving to invoice_payments join table: #{e}")
    end
  end
end
