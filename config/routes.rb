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

  root to: 'pages#show', id: 'signup'
end
