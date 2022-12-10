class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Entity, author: user
    can :manage, Group, author: user
  end
end
