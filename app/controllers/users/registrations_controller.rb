class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _options = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up Successfully',
                  data: resource }
      }, status: :ok
    else
      render json: {
        status: { message: 'User could not be created successfully',
                  errors: resource.errors.full_messages }
      }
    end
  end
end
