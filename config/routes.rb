Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do  
      mount_devise_token_auth_for 'User', at: 'auth'
      devise_for :users, controllers: {
        registrations: 'api/v1/registrations'
      }, skip: [:sessions]
      
      resources :rooms

      # Custom routes for create, update, and delete accessible only to admins
      post '/rooms', to: 'rooms#create', as: 'admin_create_room'
      patch '/rooms/:id', to: 'rooms#update', constraints: { id: /\d+/ }, as: 'admin_update_room'
      delete '/rooms/:id', to: 'rooms#destroy', constraints: { id: /\d+/ }, as: 'admin_destroy_room'

      resources :reservations
    end
  end
end
