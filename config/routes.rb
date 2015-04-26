Rails.application.routes.draw do

  root 'static#home'

  resources :users, except: [:show]
  devise_for :users
  devise_scope :user do
    get    "sign_in",  controller: 'devise/sessions', action: :new
    delete "sign_out", controller: 'devise/sessions', action: :destroy
  end

  resources :events
  get  'calendar', controller: :events, action: :calendar, as: :calendar

  resources :images, except: :show
  resources :menus,  except: [:index, :show] do
    post 'update_all', action: :update_all, on: :collection
  end
  resources :reservations do
    post 'approve', on: :member
  end

  patch '/editable_fields', controller: :editable_fields, action: :update

  get 'pages',  controller: :pages, action: :index
  get ':id',    controller: :pages, action: :show, as: :page
  patch  ':id', controller: :pages, action: :update
  delete ':id', controller: :pages, action: :destroy
  resources :pages, except: [:show, :update, :delete, :index]
end
