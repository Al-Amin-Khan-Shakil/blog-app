class Ability
  include CanCan::Ability

  def initialize(current_user)
    @user = current_user || User.new

    if @user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can %i[destroy], Comment, user_id: @user.id
      can %i[destroy create], Post, author_id: @user.id
      can :create, Comment
    end
  end
end
