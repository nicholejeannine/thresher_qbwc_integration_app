require 'rails_helper'

RSpec.describe "InvoiceLines", type: :request do
  describe "GET /invoice_lines" do
    it "works! (now write some real specs)" do
      get invoice_lines_path
      expect(response).to have_http_status(200)
    end
  end
end
