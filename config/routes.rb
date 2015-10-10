Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :diagrams do
        resources :shapes
      end
    end
  end
end
