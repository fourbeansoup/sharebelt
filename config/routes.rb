Sharebelt::Application.routes.draw do

  resources :sites do
    resources :impressions
  end

  match "/auth/:provider/callback" => "sessions#create_from_omniauth"

  root to: 'high_voltage/pages#show', id: 'home'
end
