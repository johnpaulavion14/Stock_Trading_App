Rails.application.routes.draw do
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
  get 'trader_dashboard/buy'
  get 'trader_dashboard/sell'





  devise_for :admins
  devise_for :users
  root 'home#index'

end