class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
        can :read, :all
    elsif user.has_role? :user
        can :manage, Dog
        can :manage, OwnershipRegistration
    else
        can :read, :all
    end
  end
end
