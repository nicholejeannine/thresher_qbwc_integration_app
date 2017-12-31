# For details on this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
 
  # Quickbooks stuff
  get 'qbwc/action' => 'qbwc#_generate_wsdl'
  get 'qbwc/qwc' => 'qbwc#qwc'
  get 'time_card_transactions' => 'timecard_transactions#index'
  get 'time_trackings' => 'time_trackings#index'
  post 'time_trackings' => 'time_trackings#add_request'
  wash_out :qbwc

  root to: 'home#index'
end
