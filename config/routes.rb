Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root "static_pages#home"
  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
  end
  resources :categories, except: [:destroy]
end
