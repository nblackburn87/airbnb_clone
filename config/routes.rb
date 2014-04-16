OpenHome::Application.routes.draw do

  root to: 'users#index'

  resources :users
  devise_for :users
end
