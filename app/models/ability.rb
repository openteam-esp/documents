class Ability
  include CanCan::Ability


  def initialize(user)

    return unless user

    can :manage, Context do | context |
      user.permissions.for_roles(:manager).for_context(context).exists?
    end

    can :manage, Paper do | paper |
      can? :manage, paper.context
    end

    can :manage, Document do | document |
      user.permissions.for_roles(:document_operator).for_context(document.context).exists?
    end

    can :manage, Project do | project |
      user.permissions.for_roles(:project_operator).for_context(project.context).exists?
    end

    can :manage, Permission do | permission |
      can? :manage, permission.context
    end

    can :create, Permission do | permission |
      user.manager?
    end

    can :manage, User do
      user.manager?
    end
  end
end
