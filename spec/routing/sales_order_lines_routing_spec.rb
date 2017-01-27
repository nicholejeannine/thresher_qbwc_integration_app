require "rails_helper"

RSpec.describe SalesOrderLinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sales_order_lines").to route_to("sales_order_lines#index")
    end

    it "routes to #new" do
      expect(:get => "/sales_order_lines/new").to route_to("sales_order_lines#new")
    end

    it "routes to #show" do
      expect(:get => "/sales_order_lines/1").to route_to("sales_order_lines#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sales_order_lines/1/edit").to route_to("sales_order_lines#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sales_order_lines").to route_to("sales_order_lines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sales_order_lines/1").to route_to("sales_order_lines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sales_order_lines/1").to route_to("sales_order_lines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sales_order_lines/1").to route_to("sales_order_lines#destroy", :id => "1")
    end

  end
end
