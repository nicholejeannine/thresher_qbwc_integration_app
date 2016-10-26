Rails.application.routes.draw do
  resources :customers
  get 'qbwc/action' => 'qbwc#_generate_wsdl'
  get 'qbwc/qwc' => 'qbwc#qwc'
  wash_out :qbwc
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
