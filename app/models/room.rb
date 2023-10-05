class Room < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, uniqueness: true
end
