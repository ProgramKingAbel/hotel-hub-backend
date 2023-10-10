class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  include DeviseTokenAuth::Concerns::User

  has_many :reservations

  validates :name, presence: true, length: { in: 3..25 }, uniqueness: true

  belongs_to :room, optional: true # Assuming a user belongs to a room

  validates_associated :room

  def admin?
    role == 'admin'
  end
end
