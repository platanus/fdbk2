Rails.application.routes.draw do
  root 'app/feedback_sessions#index'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount CoverImageUploader.derivation_endpoint => "/derivations/cover_image"
  mount Sidekiq::Web => '/queue'

  namespace :api, defaults: { format: :json } do
    namespace :internal do
      resources :feedback_sessions, only: [:index]
    end
  end

  namespace :app do
    resources :feedback_sessions, only: [:index, :show] do
      resources :comments, only: [:new, :create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
