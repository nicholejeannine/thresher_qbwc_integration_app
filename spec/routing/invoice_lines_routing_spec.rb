require "rails_helper"

RSpec.describe InvoiceLinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/invoice_lines").to route_to("invoice_lines#index")
    end

    it "routes to #new" do
      expect(:get => "/invoice_lines/new").to route_to("invoice_lines#new")
    end

    it "routes to #show" do
      expect(:get => "/invoice_lines/1").to route_to("invoice_lines#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/invoice_lines/1/edit").to route_to("invoice_lines#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/invoice_lines").to route_to("invoice_lines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/invoice_lines/1").to route_to("invoice_lines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/invoice_lines/1").to route_to("invoice_lines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/invoice_lines/1").to route_to("invoice_lines#destroy", :id => "1")
    end

  end
end
