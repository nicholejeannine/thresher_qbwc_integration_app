require 'rails_helper'

RSpec.describe "SalesOrderLines", type: :request do
  describe "GET /sales_order_lines" do
    it "works! (now write some real specs)" do
      get sales_order_lines_path
      expect(response).to have_http_status(200)
    end
  end
end
