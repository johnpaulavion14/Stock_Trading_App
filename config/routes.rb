Rails.application.routes.draw do

  get 'admin_dashboard/index'
  get 'admin_dashboard/alltraders'
  get 'admin_dashboard/pendingtraders'
  get 'admin_dashboard/alltransactions'
  get 'admin_dashboard/view_profile' , :as => 'view_profile'
  get 'admin_dashboard/view_portfolio' , :as => 'view_portfolio'
  get 'admin_dashboard/edit_profile' , :as => 'edit_profile'
  get 'admin_dashboard/approved' , :as => 'approved'
  get 'admin_dashboard/delete_user' , :as => 'delete_user'


  patch 'admin_dashboard/update' => 'admin_dashboard#update'







  get 'trader_dashboard/index'
  get 'trader_dashboard/portfolio'
  get 'trader_dashboard/transaction_type' , :as => 'transaction_type'
  get 'trader_dashboard/all_transactions', :as => 'trader_alltransactions'
  post 'trader_dashboard/create' => 'trader_dashboard#create', :as => 'create_transaction'
  delete 'trader_dashboard/delete_stocks' , :as => 'delete_stocks'

  devise_for :admins
  root 'home#index'
  

  devise_for :users, :controllers => { registrations: 'registrations/registrations' }


end