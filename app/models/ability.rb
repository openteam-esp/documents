class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    ## common
    can :manage, Context do | context |
      user.manager_of? context
    end

    can :manage, Permission do | permission |
      permission.context && user.manager_of?(permission.context)
    end

    can [:new, :create], Permission do | permission |
      !permission.context && user.manager?
    end

    can [:search, :index], User do
      user.manager?
    end

    can :manage, :application do
      user.have_permissions?
    end

    can :manage, :permissions do
      user.manager?
    end

    ## app specific
    can :manage, Paper do |paper|
      paper.context && user.manager_of?(paper.context)
    end

    can :manage, Paper do |paper|
      !paper.context && user.manager?
    end

    can :manage, Document do |document|
      document.context && user.document_operator_of?(document.context)
    end

    can :manage, Document do |document|
      !document.context && user.document_operator_of?(document.context)
    end

    can :manage, Project do |project|
      project.context && user.project_operator_of?(project.context)
    end

    can :manage, Project do |project|
      !project.context && user.project_operator_of?(project.context)
    end
  end
end
