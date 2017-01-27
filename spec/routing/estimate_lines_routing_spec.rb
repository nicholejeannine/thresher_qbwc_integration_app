require "rails_helper"

RSpec.describe EstimateLinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/estimate_lines").to route_to("estimate_lines#index")
    end

    it "routes to #new" do
      expect(:get => "/estimate_lines/new").to route_to("estimate_lines#new")
    end

    it "routes to #show" do
      expect(:get => "/estimate_lines/1").to route_to("estimate_lines#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/estimate_lines/1/edit").to route_to("estimate_lines#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/estimate_lines").to route_to("estimate_lines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/estimate_lines/1").to route_to("estimate_lines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/estimate_lines/1").to route_to("estimate_lines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/estimate_lines/1").to route_to("estimate_lines#destroy", :id => "1")
    end

  end
end
