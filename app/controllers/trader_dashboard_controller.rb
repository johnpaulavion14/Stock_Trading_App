class TraderDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :is_approved
  
  def index
    @stocks = Stock.all
    @client = IEX::Api::Client.new
    

  end

  def portfolio
    @transactions = current_user.transactions
    @companies = Stock.all.pluck(:name)
    @company_shares = []

    @companies.each do |company|
      shares = @transactions.where(company:company).pluck(:shares)
      total_shares = shares.reduce(0){|sum,num|sum + num}
      details = [company,total_shares]
      @company_shares.append(details)
    end
  end

  def transaction_type
    @stocks = Stock.find_by(name:params[:company])
  end

  def create
    @transaction = current_user.transactions.create(transaction_params)
    if @transaction.save!
      redirect_to trader_dashboard_portfolio_path
    else
      render :buy
    end
  end

  def all_transactions
    @all_transactions = current_user.transactions
  end

  

  

  private

  def transaction_params
    params.permit(:symbol,:current_price,:shares,:company,:commit,:status)
  end

  def is_approved
    if current_user.is_approved == false
      sign_out current_user 
      redirect_to '/'

    end
  end
  


end
