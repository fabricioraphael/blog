class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new 
      
      if user.role == "admin"
        can :manage, :all
      elsif user.role == "user"
        can :read, :all
        can :create, Comentario
        can [:create, :update, :destroy], Post
      elsif user.role == "commentator"
        can :read, :all
        can :create, Comentario
      else
        can :read, :all
      end
    end
       
    def load_and_authorize_resource
       can :create, Post
       load_resource
       authorize_resource
    end
end
