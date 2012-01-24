class Ability
  include CanCan::Ability


  def initialize(user)

    return unless user

    alias_action :create, :read, :update, :destroy, :to => :modify

    can :modify, Context do | context |
      (user.contexts_for(:manager) & context.ancestors + [context]).any?
    end

    can :modify, Paper do | paper |
      can? :modify, paper.context
    end

    can :modify, Document do | document |
      (user.contexts_for(:document_operator) & document.context.ancestors + [document.context]).any?
    end

    can :modify, Project do | project |
      (user.contexts_for(:project_operator) & project.context.ancestors + [project.context]).any?
    end

    can :modify, Permission do | permission |
      can? :modify, permission.context
    end

    can :modify, Permission do | permission |
      !permission.context && user.manager?
    end

    can :modify, User do
      user.manager?
    end
  end
end
