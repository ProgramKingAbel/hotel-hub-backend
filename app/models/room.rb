# app/models/room.rb
class Room < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :price, numericality: { greater_than: 0 }

  has_many :reservations

  private

  def admin_can_create
    return unless user && !user.admin?

    errors.add(:base, 'Only admins can create rooms')
  end

  def admin_can_delete
    return unless user && !user.admin?

    errors.add(:base, 'Only admins can delete rooms')
  end

  def admin_can_update
    return unless user && !user.admin?

    errors.add(:base, 'Only admins can update rooms')
  end
end
