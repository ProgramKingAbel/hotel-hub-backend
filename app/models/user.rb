class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :reservations

  validates :name, presence: true, length: { in: 3..25 }
  enum role: { user: 'user', admin: 'admin' }

  def generate_jwt
    payload = {
      sub: id,
      exp: 60.days.from_now.to_i,
      iat: Time.now.to_i,
      jti: SecureRandom.uuid
    }

    Devise::JWT::TestHelpers.jwt_token(self, User, payload)
  end
end
