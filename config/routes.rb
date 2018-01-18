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
  
  # View errors in time trackings? (TODO: might go in jobs??)
  get 'time_trackings/errors' => 'time_trackings#errors'
  
  root to: 'qbwc_jobs#index'
end
