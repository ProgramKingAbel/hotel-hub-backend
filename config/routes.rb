Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do        
      resources :rooms, only: [:index, :show, :create, :update, :destroy]

      resources :reservations, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
