class TraderDashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @stocks = current_user.stocks
  end
end
