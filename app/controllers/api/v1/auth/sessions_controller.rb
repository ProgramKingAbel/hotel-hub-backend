# app/controllers/api/v1/auth/sessions_controller.rb

class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  before_action :ensure_params_exist, only: :create

  def create
    super do |resource|
      if resource.persisted?
        render json: {
          message: 'Login successful.',
          data: resource.as_json(except: [:tokens])
        }, status: :ok
      else
        render json: {
          message: 'Invalid email or password.',
          data: resource.as_json(except: [:tokens])
        }, status: :unprocessable_entity
      end
    end
  end

  private

  def ensure_params_exist
    return unless params[:user].blank?

    render json: {
      message: 'Missing user parameter.',
      data: {}
    }, status: :unprocessable_entity
  end
end
