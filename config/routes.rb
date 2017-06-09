# For details on this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
 
  # Quickbooks stuff
  get 'qbwc/action' => 'qbwc#_generate_wsdl'
  get 'qbwc/qwc' => 'qbwc#qwc'
  wash_out :qbwc

  root to: 'home#index'
end
