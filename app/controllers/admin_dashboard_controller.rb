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

    if @user.update!(user_params)
      redirect_to view_profile_path
    end
  end
  
  def view_portfolio
    @user = User.find_by(email:params[:email])
    transactions = @user.transactions
    active_company = transactions.pluck(:company).uniq

    @company_shares = []

    active_company.each do |company|
      # shares = @transactions.where(company:company.name).pluck(:shares)
      current_price = Stock.all.find_by(name:company).price

      shares = transactions.where(company:company).pluck(:shares)

      # shares = @transactions.pluck(:shares)

      last_price = transactions.where(company:company).last.current_price

      total_shares = shares.reduce(0){|sum,num|sum + num}
      details = {name:company, shares:total_shares, current_price:current_price, last_price:last_price}
      @company_shares.append(details)
    end
   

  end

  def delete_user
    @user = User.find_by(email:params[:email])
    if @user.destroy && @user.transactions.destroy_all
      redirect_to admin_dashboard_alltraders_path
    end
  end

  def approved
    @user = User.find_by(email:params[:email])
    if @user.update(is_approved:true)
      UserMailer.with(user: @user).welcome_email.deliver_now
      redirect_to admin_dashboard_alltraders_path
    end
  end


  private

  def user_params
    params.permit(:first_name,:last_name,:gender,:age,:address,:email)
  end
end
