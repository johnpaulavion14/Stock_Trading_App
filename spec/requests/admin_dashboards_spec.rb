require 'rails_helper'

RSpec.describe "AdminDashboards", type: :request do
  describe "#GET /admin_dashboards" do
    before do
      sign_in create(:admin)
    end
    it "go to admin alltraders page" do
      get admin_dashboard_alltraders_path
      expect(response).to have_http_status(200)
    end    
    it "go to admin all transactions page" do
      get admin_dashboard_alltransactions_path
      expect(response).to have_http_status(200)
    end   
    it "go to admin all transactions page" do
      get new_trader_path
      expect(response).to have_http_status(200)
    end

  end
end
