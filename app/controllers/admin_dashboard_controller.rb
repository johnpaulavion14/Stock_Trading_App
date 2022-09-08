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
    @user = User.find_by(email:params[:email])
    @transactions = @user.transactions
    @companies = Stock.all.pluck(:name)
    @company_shares = []

    @companies.each do |company|
      shares = @transactions.where(company:company).pluck(:shares)
      total_shares = shares.reduce(0){|sum,num|sum + num}
      details = [company,total_shares]
      @company_shares.append(details)
    end

  end


  private

  def user_params
    params.permit(:first_name,:last_name,:gender,:age,:address,:email)
  end
end
