module AuthenticationHelper
    def sign_in_and_get_token(email, password)
      post '/users/sign_in', params: { user: { email: email, password: password } }
      response.headers['Authorization']
    end
  end