Rails.application.routes.draw do
  namespace :outpost do
    resources :posts

    get "/activity" => "versions#activity", as: :activity
    get "/:resources/:resource_id/history" => "versions#index", as: :history
    get "/:resources/:resource_id/history/:version_number" => "versions#show", as: :version

    resources :sessions, only: [:create, :destroy]
    get 'login'  => "sessions#new", as: :login
    get 'logout' => "sessions#destroy", as: :logout

    root to: 'home#dashboard'
  end
end
