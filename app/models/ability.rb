class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, Page
    can :read, Event
    can [:create, :read], Reservation

    if user.persisted?
      can :read, Document
    end

    if user.admin? || user.super_admin?
      can :manage, :all
      cannot :update, User
      can :update, user
    end
  end
end
