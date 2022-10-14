require 'rails_helper'

RSpec.describe "TraderDashboards", type: :request do
  describe "GET /trader_dashboards" do
    before do
      sign_in create(:user)
    end
    it "go to trader dashboard page" do
      get trader_dashboard_index_path
      expect(response).to have_http_status(200)
    end    
    it "go to trader portfolio page" do
      get trader_dashboard_portfolio_path
      expect(response).to have_http_status(200)
    end   
    it "go to trader all transactions page" do
      get trader_alltransactions_path
      expect(response).to have_http_status(200)
    end

  end
end
