Rails.application.routes.draw do
  devise_for :users
  root 'static#home'

  resources :posts

  get 'pages',  to: 'pages#index'
  get ':id',    to: 'pages#show', as: :page
  patch ':id',  to: 'pages#update'
  delete ':id', to: 'pages#destroy'
  resources :pages, except: [:show, :update, :delete, :index]
end
