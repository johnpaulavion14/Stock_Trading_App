class HomeController < ApplicationController
  def index
    @client = IEX::Api::Client.new
    
  end
end
