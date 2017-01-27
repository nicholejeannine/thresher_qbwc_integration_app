# For details on this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
scope module: 'public' do
    get :index
    get :home, action: :index
    get :about
    get :av_design
    get :careers
    get :contact
    get :press
    get :services
    get :sitemap
    get :team
  end
  get '/portal'  => 'sessions#new', as: :login
  post '/portal' => 'sessions#create'
  post '/logout' => 'sessions#destroy', as: :logout
  get '/start-page', to: 'users#start_page'

  # Quickbooks stuff
  get 'qbwc/action' => 'qbwc#_generate_wsdl'
  get 'qbwc/qwc' => 'qbwc#qwc'
  wash_out :qbwc

  resources :jobs, :projects, param: :full_name, only: [:index, :show]

  resources :customers, only: [:index, :show], param: :full_name do
    member do
      get :tree, to: 'customers#tree'
      get :projects, to: 'customers#projects'
      get :test, to: 'customers#test'
    end
  end
  root to: 'public#index'
end
