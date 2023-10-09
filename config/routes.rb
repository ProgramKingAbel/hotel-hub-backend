Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do  
      mount_devise_token_auth_for 'User', at: 'auth'
      devise_for :users, controllers: {
        registrations: 'api/v1/registrations'
      }, skip: [:sessions]
      resources :rooms

      # Custom route for deleting rooms accessible only to admins
      delete '/api/v1/rooms/:id', to: 'rooms#destroy', constraints: { id: /\d+/ }, as: 'admin_destroy_room'

      resources :reservations
    end
  end
end
