class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations

  validates :name, presence: true, length: { in: 3..25 }, uniqueness: true
  enum role: { user: 'user', admin: 'admin' }
end
