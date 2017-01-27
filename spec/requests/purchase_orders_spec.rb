require 'rails_helper'

RSpec.describe "PurchaseOrders", type: :request do
  describe "GET /purchase_orders" do
    it "works! (now write some real specs)" do
      get purchase_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
