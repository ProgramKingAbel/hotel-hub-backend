Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do  
      devise_for :users
      resources :rooms
      resources :reservations
    end
  end
end
