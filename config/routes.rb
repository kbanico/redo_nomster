Rails.application.routes.draw do
  get 'profiles/show'

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

  # user profile
  get ':username', to: "profiles#show", as: :profile
  get ':username/edit', to: 'profiles#edit', as: :edit_profile


  mount ActionCable.server, at: "/cable"
end


