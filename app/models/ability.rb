class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, Page
      can :manage, Post
      can :manage, Menu
    end
  end
end
