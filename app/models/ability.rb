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

    if user.admin?
      can :manage, :all
      #cannot :update, User
      can :update, user
    end

    if user.has_role?('editor')
      can :manage, Page
      can :manage, Event
    end

    if user.has_role?('reservation_manager')
      can :manage,  Reservation
      can :approve, Reservation
      can :read, Location
    end
  end
end
