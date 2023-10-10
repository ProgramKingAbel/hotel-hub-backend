class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  include DeviseTokenAuth::Concerns::User

  has_many :reservations

  validates :name, presence: true, length: { in: 3..25 }, uniqueness: true
  enum role: { user: 'user', admin: 'admin' }
end
