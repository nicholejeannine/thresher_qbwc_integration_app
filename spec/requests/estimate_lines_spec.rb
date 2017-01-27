require 'rails_helper'

RSpec.describe "EstimateLines", type: :request do
  describe "GET /estimate_lines" do
    it "works! (now write some real specs)" do
      get estimate_lines_path
      expect(response).to have_http_status(200)
    end
  end
end
