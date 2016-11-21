# For details on this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  resources :invoices
  resources :expense_lines
  resources :customers, only: [:index, :show]
  resources :estimates, only: [:index, :show]
  

  controller 'public' do
        get '/about-us'  => 'public#about'
        get '/av_design' => 'public#av_design'
        get '/careers'  => 'public#careers'
        get '/contact-us'  => 'public#contact'
        get '/home' => 'public#index'
        get '/portal'  => 'public#portal', as: :login
        get '/pressRelease'  => 'public#press'
        get '/services'  => 'public#services'
        get '/sitemap'  => 'public#sitemap'
        get '/meet-the-team'  => 'public#team'
    end

   # eventually the login page
  # post '/portal' => 'sessions#create'
  # get '/logout' => 'sessions#destroy', as: :logout

  # Quickbooks stuff
  get 'qbwc/action' => 'qbwc#_generate_wsdl'
  get 'qbwc/qwc' => 'qbwc#qwc'
  wash_out :qbwc
   # eventually the login page
  # post '/portal' => 'sessions#create'
  root to: 'public#index'
  # get '/logout' => 'sessions#destroy', as: :logout
  # Only permit index and show routes for customers
end
