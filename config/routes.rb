Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do  
      mount_devise_token_auth_for 'User', at: 'auth'
      devise_for :users, controllers: {
        registrations: 'api/v1/registrations'
      }, skip: [:sessions]
      
      resources :rooms


      resources :reservations
    end
  end
end
