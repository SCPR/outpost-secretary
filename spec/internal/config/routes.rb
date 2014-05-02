Rails.application.routes.draw do
  mount Outpost::Engine, at: 'outpost'
  mount Outpost::Secretary::Engine, at: 'outpost', as: 'secretary'

  namespace :outpost do
    resources :posts
  end
end
