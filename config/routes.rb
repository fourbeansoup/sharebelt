Sharebelt::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#create_from_omniauth"

  root to: 'high_voltage/pages#show', id: 'home'
  resources :impressions
end
