require 'rails_helper'

RSpec.describe "AppDashboards", type: :request do
  describe "GET /index" do
    it "returns http redirect if not login" do
      get "/app_dashboard/index"
      expect(response).to have_http_status(:redirect)
    end
  
    context "User login" do
      login_user
      it "returns http success" do
        get "/app_dashboard/index"
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /data" do
    login_user
    it "returns http success" do
      get "/app_dashboard/data"
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      Product.create(name: "Product", price: 10, percent_discount: 10)
      post "/app_dashboard/process_data"
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(action: :data)
    end
  end

end
