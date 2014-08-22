class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can :read, ActiveAdmin::Page, name: 'Dashboard'
    can :manage, AdminUser
    can :manage, Inquiry
  end
end
