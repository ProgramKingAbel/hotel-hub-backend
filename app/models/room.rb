class Room < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :price, numericality: { greater_than: 0 }

  has_many :reservations

  validate :admin_can_create, on: :create
  validate :admin_can_delete, on: :destroy
  validate :admin_can_update, on: :update

  private

  def admin_can_create
    return unless User.current && !User.current.admin?

    errors.add(:base, 'Only admins can create rooms')
  end

  def admin_can_delete
    return unless User.current && !User.current.admin?

    errors.add(:base, 'Only admins can delete rooms')
  end

  def admin_can_update
    return unless User.current && !User.current.admin?

    errors.add(:base, 'Only admins can update rooms')
  end
end
