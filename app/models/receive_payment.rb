class ReceivePayment < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :customer, optional: true


  def parse_linked_txn(hash)
    QbwcError.create(:model_id => self.id, :worker_class=>"PaymentParse", :error_message=>"#{hash.inspect}")
    if hash["txn_type"] == "Invoice"
      self.invoice_id = hash["txn_id"]
    end
  end
end
