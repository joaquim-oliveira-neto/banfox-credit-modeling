Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :report_requests, only: [:new, :create, :index, :show]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :key_indicator_reports, only: [:create]
    end
  end
end
