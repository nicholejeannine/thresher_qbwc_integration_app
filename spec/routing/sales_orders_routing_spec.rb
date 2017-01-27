require "rails_helper"

RSpec.describe SalesOrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sales_orders").to route_to("sales_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/sales_orders/new").to route_to("sales_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/sales_orders/1").to route_to("sales_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sales_orders/1/edit").to route_to("sales_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sales_orders").to route_to("sales_orders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sales_orders/1").to route_to("sales_orders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sales_orders/1").to route_to("sales_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sales_orders/1").to route_to("sales_orders#destroy", :id => "1")
    end

  end
end
