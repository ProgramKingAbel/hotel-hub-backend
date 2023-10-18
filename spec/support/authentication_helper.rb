module AuthenticationHelper
  def sign_in_and_get_token(email, password)
    post '/users/sign_in', params: { user: { email:, password: } }
    response.headers['Authorization']
  end
end
