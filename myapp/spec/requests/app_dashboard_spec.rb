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

end
