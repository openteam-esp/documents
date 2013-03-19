# encoding: utf-8

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can :manage, :all         if user.manager_of?(Context.first)
    can :manage, :application if user.permissions.any?

    can :read, User if user.manager?

    can :manage, Permission do |permission|
      permission.persisted? && user.manager_of?(permission.context)
    end

    can :manage, Permission do |permission|
      !permission.context && user.manager?
    end

    can :read, Paper if user.permissions.any?

    can :manage, Paper do |paper|
      paper.context && user.roles_for(paper.context).any?
    end

    can :manage, Paper do |paper|
      !paper.context && user.permissions.any?
    end
  end
end
