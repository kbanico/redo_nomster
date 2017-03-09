Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root "static_pages#home"
  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
    #resources :comment_to_photos, only: :create
  end

  resources :messages


  resources :photos do
    resources :comment_to_photos, only: [:index,:create,:destroy]
  end

  resources :categories, except: [:destroy]
end
