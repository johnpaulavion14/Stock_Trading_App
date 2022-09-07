class TraderDashboardController < ApplicationController
  before_action :authenticate_user!
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

  def buy
    @stocks = Stock.find_by(name:params[:company])
  end

  def sell
    
  end

  def create
    # @company = Transaction.find_by(company:params[:company])
    @transaction = current_user.transactions.create(transaction_params)
    if @transaction.save!
      redirect_to trader_dashboard_index_path
    else
      render :buy
    end
    # if @company.status == "owned"
    #   redirect_to trader_dashboard_index_path
    # else
      
    # end
  end

  def update
    @transaction = Transaction.create(transaction_params)
    if @transaction.save!
      redirect_to trader_dashboard_index_path
    else
      render :buy
    end
  end

  private

  def transaction_params
    params.permit(:symbol,:current_price,:shares,:company,:commit,:status)
  end
  


end
