# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: 'sessions' }
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root 'home#index'

  resources :draws, only: [:new, :create] # rubocop:disable Style/SymbolArray
  resources :draw_users
  resources :match_friends
end
