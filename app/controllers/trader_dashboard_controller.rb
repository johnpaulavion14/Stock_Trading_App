class TraderDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :is_approved
  
  def index
    @stocks = Stock.all
    @client = IEX::Api::Client.new
  end

  def portfolio
    transactions = current_user.transactions
    active_company = transactions.pluck(:company).uniq

    @company_details = []

    active_company.each do |company|

      current_price = Stock.all.find_by(name:company).price

      action_and_shares = transactions.where(company:company).pluck(:commit, :shares)
      shares_array = []
      action_and_shares.each do |array|
        if array[0] == 'buy'
          shares_array.append(array[1])
        else
          shares_array.append(-array[1])
        end
      end

      last_price = transactions.where(company:company).last.current_price

      total_shares = shares_array.reduce(0){|sum,num|sum + num}
      details = {name:company, shares:total_shares, current_price:current_price, last_price:last_price}
      @company_details.append(details)
    end
  end

  def transaction_type
    @stocks = Stock.find_by(name:params[:company])
    @max = params[:shares].to_i 
  end

  def create
    
    if current_user.transactions.create(transaction_params)
      redirect_to trader_dashboard_portfolio_path
    else
      render :transaction_type
    end
  end

  def all_transactions
    @all_transactions = current_user.transactions
  end

  def update_stocks
    @client = IEX::Api::Client.new 
    Stock.find_by(symbol:'AMD').update(name:"Advanced Micro Devices", symbol:'AMD', price:sprintf('%.2f',@client.quote('AMD').latest_price), percent_change:@client.quote('AMD').change_percent_s.to_s)
    Stock.find_by(symbol:'NVDA').update(name:"NVIDIA Corporation", symbol:"NVDA", price:sprintf('%.2f',@client.quote('NVDA').latest_price), percent_change:@client.quote('NVDA').change_percent_s.to_s)
    Stock.find_by(symbol:'GME').update(name:"GameStop Corp.", symbol:"GME", price:sprintf('%.2f',@client.quote('GME').latest_price), percent_change:@client.quote('GME').change_percent_s.to_s)
    Stock.find_by(symbol:'AAPL').update(name:"Apple Inc.", symbol:"AAPL", price:sprintf('%.2f',@client.quote('AAPL').latest_price), percent_change:@client.quote('AAPL').change_percent_s.to_s)
    Stock.find_by(symbol:'GOOG').update(name:"Alphabet, Inc.", symbol:"GOOG", price:sprintf('%.2f',@client.quote('GOOG').latest_price), percent_change:@client.quote('GOOG').change_percent_s.to_s)
    Stock.find_by(symbol:'MSFT').update(name:"Microsoft Corporation", symbol:"MSFT", price:sprintf('%.2f',@client.quote('MSFT').latest_price), percent_change:@client.quote('MSFT').change_percent_s.to_s)
    Stock.find_by(symbol:'TWTR').update(name:"Twitter, Inc.", symbol:"TWTR", price:sprintf('%.2f',@client.quote('TWTR').latest_price), percent_change:@client.quote('TWTR').change_percent_s.to_s)
    Stock.find_by(symbol:'META').update(name:"Meta Platforms, Inc.", symbol:"META", price:sprintf('%.2f',@client.quote('META').latest_price), percent_change:@client.quote('META').change_percent_s.to_s)
    Stock.find_by(symbol:'AMZN').update(name:"Amazon.com Inc.", symbol:"AMZN", price:sprintf('%.2f',@client.quote('AMZN').latest_price), percent_change:@client.quote('AMZN').change_percent_s.to_s)
    Stock.find_by(symbol:'BBBY').update(name:"Bed Bath & Beyond Inc.", symbol:"BBBY", price:sprintf('%.2f',@client.quote('BBBY').latest_price), percent_change:@client.quote('BBBY').change_percent_s.to_s)

    redirect_to trader_dashboard_index_path
    
  end

  private

  def transaction_params
    params.permit(:symbol,:current_price,:company,:commit,:status,:shares)
  end


  def is_approved
      if current_user.is_approved == false
        sign_out current_user 
        redirect_to root_path({login: "not_approved"}), alert: "Need Admin Approval to Login" 
      end
  end

end














