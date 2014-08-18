class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can :manage, AdminUser
    can :manage, Inquiry
    can [:read, :destroy], Contact
  end
end
