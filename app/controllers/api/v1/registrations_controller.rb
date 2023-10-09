class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # POST http://127.0.0.1:3000/api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      token = generate_auth_token(@user)
      render json: { token: token }, status: :created
      # render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def generate_auth_token(user)
    payload = { user_id: user.id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end  
end
