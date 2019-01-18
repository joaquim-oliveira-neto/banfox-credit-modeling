Rails.application.routes.draw do
  constraints(Subdomain) do
    devise_for :users
    root to: 'pages#home'
    resources :report_requests, only: [:new, :create, :index, :show]
  end
end
