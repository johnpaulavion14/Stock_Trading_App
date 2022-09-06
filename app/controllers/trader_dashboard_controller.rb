class TraderDashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @stocks = Stock.all
    @client = IEX::Api::Client.new
    

  end
  def portfolio
    
  end

  def buy
    
  end

  def sell
    
  end


end
