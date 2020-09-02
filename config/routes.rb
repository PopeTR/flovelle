Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :flower_subscriptions
  resources :accounts, only: [:index, :show, :update, :edit]
  resources :payments, only: [:index]
  namespace :manager do
    resources :dashboard
  end

  get "/about", to: "pages#about"
  get "/flowers", to: "pages#flowers"
  get "/contact", to: "pages#contact"
  get "/feedback", to: "pages#new_feedback"
  post "/feedback/:id", to: "pages#create_feedback"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
