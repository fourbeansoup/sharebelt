Sharebelt::Application.routes.draw do

  resources :reports

  resources :sites do
    resources :impressions do
      member do
        get 'click'
      end
    end
  end

  match "/auth/:provider/callback" => "sessions#create_from_omniauth"

  root to: 'high_voltage/pages#show', id: 'home'
end
