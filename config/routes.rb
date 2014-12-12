Rails.application.routes.draw do

  root 'static#home'
  devise_for :users
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    delete "sign_out", to: "devise/sessions#destroy"
  end

  resources :posts
  resources :menus, expect: [:index, :show]
  resources :images, expect: :show

  post '/editable_fields', to: 'editable_fields#update'

  get 'pages',  to: 'pages#index'
  get ':id',    to: 'pages#show', as: :page
  patch ':id',  to: 'pages#update'
  post  ':id',  to: 'pages#update'
  delete ':id', to: 'pages#destroy'
  resources :pages, except: [:show, :update, :delete, :index]
end
