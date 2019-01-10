Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :report_requests, only: [:new, :create, :show]
end
