class AdminDashboardController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def alltraders
    @traders = User.all
  end

  def pendingtraders
  end

  def alltransactions
    @all_transactions = Transaction.all
  end

  def view_profile
    @view_profile = User.find_by(email:params[:email])
    
  end

  def edit_profile
    @profile = User.find_by(email:params[:email])
  end

  def update
    @user = User.find_by(email:params[:email])

    if @user.update(user_params)
      redirect_to view_profile_path
    end
  end
  
  def view_portfolio
    @view_profile = User.find_by(email:params[:email])

  end


  private

  def user_params
    params.permit(:first_name,:last_name,:gender,:age,:address,:email)
  end
end
