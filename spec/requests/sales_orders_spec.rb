require 'rails_helper'

RSpec.describe "SalesOrders", type: :request do
  describe "GET /sales_orders" do
    it "works! (now write some real specs)" do
      get sales_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
