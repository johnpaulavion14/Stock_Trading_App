require 'rails_helper'

RSpec.describe "TraderDashboards", type: :request do
  describe "GET /trader_dashboards" do
    before do
      sign_in create(:user)
    end
    it "go to trader index" do
      get trader_dashboard_index_path
      expect(response).to have_http_status(200)
    end
  end


end
