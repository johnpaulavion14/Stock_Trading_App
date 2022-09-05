Rails.application.routes.draw do
  get 'admin_dashboard/index'
  get 'trader_dashboard/index'
  devise_for :admins
  devise_for :users
  root 'home#index'

end