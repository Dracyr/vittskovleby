Rails.application.routes.draw do
  devise_for :users
  root 'static#home'

  resources :posts
  resources :menus, expect: [:index, :show]
  resources :images, expect: :show

  get 'pages',  to: 'pages#index'
  get ':id',    to: 'pages#show', as: :page
  patch ':id',  to: 'pages#update'
  delete ':id', to: 'pages#destroy'
  resources :pages, except: [:show, :update, :delete, :index] do
    post 'update_all', on: :collection
  end

end
