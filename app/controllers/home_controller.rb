class HomeController < ApplicationController
  before_action :is_admin

  def index
    
  end

  private
  def is_admin
    if params[:admin]
      sign_out current_user 
      redirect_to root_path({admin_notice: "Admin Successfully Created"})
    end
  end
  
end
