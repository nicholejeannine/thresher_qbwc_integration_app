# For details on this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
 
  # Quickbooks stuff
  get 'qbwc/action' => 'qbwc#_generate_wsdl'
  get 'qbwc/qwc' => 'qbwc#qwc'
  wash_out :qbwc
  
  # View all the timecard-related jobs
  get 'qbwc_jobs' => 'qbwc_jobs#index'
  
  # Page to view previous exports (when button pressed, a link to "successes", a link to "errors")
  resources :timecard_transactions, only: [:new, :create]
  get 'time_trackings' => 'time_trackings#index'

  root to: 'home#index'
end
