class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, Page
    can :read, Event
    can [:create, :read], Reservation
    if user.admin?
      can :manage, :all
      cannot :update, User
      can :update, user
    end
  end
end
