class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @all_transactions = current_user.transactions
  end
end
