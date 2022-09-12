class TraderDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :is_approved
  
  def index
    @stocks = Stock.all
    @client = IEX::Api::Client.new


    # @prices = []
    # @stocks.each do |stock|
    #   @prices.append(@client.quote(stock.symbol).latest_price)

    # end
    
    

  end

  def portfolio
    transactions = current_user.transactions
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

  def transaction_type
    @stocks = Stock.find_by(name:params[:company])
  end

  def create
    @transaction = current_user.transactions.create(transaction_params)
    if @transaction.save!
      redirect_to trader_dashboard_portfolio_path
    else
      render :transaction_type
    end
  end

  def all_transactions
    @all_transactions = current_user.transactions
  end

  def delete_stocks
    if Stock.destroy_all
      redirect_to trader_dashboard_index_path
    end
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
