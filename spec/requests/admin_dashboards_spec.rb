require 'rails_helper'

RSpec.describe "AdminDashboards", type: :request do
  describe "GET /admin_dashboards" do
    
    before do
      sign_in create(:user)
      sign_in create(:admin)
    end

    it "go to admin alltraders page" do
      get admin_dashboard_alltraders_path
      expect(response).to have_http_status(200)
    end

    it "go to admin alltransactions page" do
      get admin_dashboard_alltraders_path
      expect(response).to have_http_status(200)
    end

    # it "go to view profile page" do
    #   get view_profile_path({email:'john+1@test.test'})
    #   expect(response).to have_http_status(200)
    # end

        # it "go to view profile page" do
    #   # user_params = {
    #   #   email: 'actionmailer123@gmail.com'
    #   # }
    #   # get view_profile_path(user), params: {user: user_params}
    #   get view_profile_path(user)
    #   expect(response).to have_http_status(200)
    # end


  end


  



end
