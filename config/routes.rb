OpenHome::Application.routes.draw do

  root to: 'pages#home'

  match '/home', { :via => :get, :to => 'pages#home' }

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users, only: [:index, :show]
  resources :listings
end
