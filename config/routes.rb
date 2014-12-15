Rails.application.routes.draw do

  root 'pages#show', id: 'home'
  devise_for :users
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    delete "sign_out", to: "devise/sessions#destroy"
  end

  resources :posts
  resources :images, expect: :show
  resources :menus, expect: [:index, :show] do
    post 'update_all', to: :update_all, on: :collection
  end

  patch '/editable_fields', to: 'editable_fields#update'

  get 'pages',  to: 'pages#index'
  get ':id',    to: 'pages#show', as: :page
  patch  ':id', to: 'pages#update'
  delete ':id', to: 'pages#destroy'
  resources :pages, except: [:show, :update, :delete, :index]
end
