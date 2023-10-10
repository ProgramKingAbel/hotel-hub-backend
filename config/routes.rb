Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do  
      # Devise authentication routes
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/registrations'
      }
      
      # Additional resources for rooms and reservations
      resources :rooms, only: [:index, :create, :show, :update, :destroy]
      resources :reservations
    end
  end
end
