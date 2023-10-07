class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, [Room, Reservation]

    return unless user.role == 'admin'

    can :manage, :all
  end
end
