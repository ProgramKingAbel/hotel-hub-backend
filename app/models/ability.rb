class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Room
    can :manage, Reservation

    return unless user.admin?

    can :manage, :all
  end
end
