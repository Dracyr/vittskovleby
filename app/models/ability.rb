class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, Page
    can :read, Event
    can [:create, :read], Reservation

    can :read, Document if user.persisted?

    if user.admin?
      can :manage, :all
      can :update, user
    end

    if user.role?('editor')
      can :manage, Page
      can :manage, Event
    end

    if user.role?('reservation_manager')
      can :manage,  Reservation
      can :approve, Reservation
      can :read, Location
    end
  end
end
