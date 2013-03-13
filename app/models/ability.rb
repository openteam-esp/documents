# encoding: utf-8

class Ability
  include CanCan::Ability

  def authorities
    @authorities ||= Context.find_by_title('Органы власти')
  end

  def manager_of?(user, context)
    context.path.each { |context| return true if user.manager_of?(context) }

    false
  end

  def operator_of?(user, context)
    context.path.each { |context| return true if user.operator_of?(context) }

    false
  end

  def initialize(user)
    return unless user

    can :manage, :all         if user.manager_of?(authorities)
    can :manage, :application if user.permissions.any?

    can :read, User if user.manager?

    can :create, Permission if user.manager?

    can [:update, :destroy], Permission do |permission|
      manager_of?(user, permission.context)
    end

    can [:read, :create], [Document, Project] if user.operator? || user.manager?

    can [:update, :destroy], [Document, Project] do |obj|
      operator_of?(user, obj.context) || manager_of?(user, obj.context)
    end
  end
end
