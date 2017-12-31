# For details on this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
 
  # Quickbooks stuff
  get 'qbwc/action' => 'qbwc#_generate_wsdl'
  get 'qbwc/qwc' => 'qbwc#qwc'
  wash_out :qbwc
  get 'qbwc_jobs' => 'qbwc_jobs#index'
  resources :timecard_transactions, only: [:index, :show]
  get 'time_trackings' => 'time_trackings#index'
  post 'time_trackings' => 'time_trackings#add_request'

  root to: 'home#index'
end
