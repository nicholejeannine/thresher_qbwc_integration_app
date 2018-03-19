# For details on this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
 
  # SOAP / Web Connector required routes
  get 'qbwc/action' => 'qbwc#_generate_wsdl'
  get 'qbwc/qwc' => 'qbwc#qwc'
  wash_out :qbwc
  
  # Custom routes
  # QBWC jobs - just display right now, TODO: add edit/update routes
  resources :qbwc_jobs, only: [:index]
  
  # Timecard Transactions come from Thresher - they are timecard entries, not necessarily in Quickbooks yet.
  # TODO: "new/create actions might go in the qbwc_jobs controller ..."
  resources :timecard_transactions, only: [:index, :new]

  # Time trackings are successfully exported time card transactions - we can just view those
  resources :time_trackings, only: [:index, :create]
  
  # Post request to '/projects' will push a new customer (project) to QB
  post '/projects' => 'projects#create'
  
  # These are just views documenting the sync process:
  get '/projects' => 'home#projects'
  get '/customers' => 'home#customers'
  get '/jobs' => 'home#jobs'
  root to: 'home#index'
end
