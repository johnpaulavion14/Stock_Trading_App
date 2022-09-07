Rails.application.routes.draw do
  get 'transactions/index'
  get 'stocks/create'
  get 'stocks/delete'
  get 'stocks/show'
  get 'stocks/update'

  get 'admin_dashboard/index'
  get 'admin_dashboard/alltraders'
  get 'admin_dashboard/pendingtraders'
  get 'admin_dashboard/alltransactions'



  get 'trader_dashboard/index'
  get 'trader_dashboard/portfolio'
  get 'trader_dashboard/buy' => 'trader_dashboard#buy', :as => 'buy_stock'
  get 'trader_dashboard/sell'
  post 'trader_dashboard/create' => 'trader_dashboard#create', :as => 'create_transaction'

  devise_for :admins
  devise_for :users
  root 'home#index'

end