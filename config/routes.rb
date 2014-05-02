Outpost::Secretary::Engine.routes.draw do
  get "/activity" => "outpost/versions#activity", as: :activity
  get "/:resources/:resource_id/history" => "outpost/versions#index", as: :history
  get "/:resources/:resource_id/history/:version_number" => "outpost/versions#show", as: :version
end
