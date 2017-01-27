require 'rails_helper'

RSpec.describe "PurchaseOrderLines", type: :request do
  describe "GET /purchase_order_lines" do
    it "works! (now write some real specs)" do
      get purchase_order_lines_path
      expect(response).to have_http_status(200)
    end
  end
end
