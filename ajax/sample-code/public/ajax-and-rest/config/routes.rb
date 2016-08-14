Rails.application.routes.draw do
  root "random_fortune#index"

  namespace :api do
    resources :fortunes
  end

  resources :fortunes, only: [:index, :create]
  resource :random_fortune, only: [:index]
end
