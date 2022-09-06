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
  end
end
