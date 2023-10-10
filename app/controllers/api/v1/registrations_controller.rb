class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json
end
