require 'rails_helper'

RSpec.describe PublicController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #av_design" do
    it "returns http success" do
      get :av_design
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #careers" do
    it "returns http success" do
      get :careers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #press" do
    it "returns http success" do
      get :press
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #services" do
    it "returns http success" do
      get :services
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sitemap" do
    it "returns http success" do
      get :sitemap
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #team" do
    it "returns http success" do
      get :team
      expect(response).to have_http_status(:success)
    end
  end

end
