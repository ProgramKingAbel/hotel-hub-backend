class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, :check_out, presence: true
  validates :user_id, :room_id, presence: true

  def check_in_must_be_before_check_out
    return unless check_in.present? && check_out.present? && check_in >= check_out

    errors.add(:check_in, 'must be before check-out')
  end

  def no_reservation_overlap
    if Reservation.where(room_id:)
        .where('check_in < ? AND check_out > ?', check_out, check_in)
        .where.not(id:)
        .exists?
      errors.add(:base, 'This room is already reserved during that time.')
    end
  end

  def check_in_and_check_out_are_in_the_future
    return unless check_in && check_out && (check_in < Date.today || check_out < Date.today)

    errors.add(:base, 'Reservations must be for future dates.')
  end
end
