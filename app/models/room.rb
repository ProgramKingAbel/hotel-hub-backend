class Room < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, uniqueness: true

  has_many :reservations
  belongs_to :user
end
