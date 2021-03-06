Rails.application.routes.draw do
  # user
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'

  }

  resources :users, only: %i[show index]
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?

  root 'startups#index'
  # root 'home#home'

  resources :startups do
    resources :comments
  end
  resources :termes

  resources :relationships, only: %i[create show destroy]

  resources :favorites, only: %i[create destroy]

  resources :conversations do
    resources :messages
  end
end
