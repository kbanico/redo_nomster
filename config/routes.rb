Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root "places#index"
  resources :places
  resources :categories, except: [:destroy]
end
