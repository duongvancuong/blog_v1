class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.client? && user.admin?
      can :manage, :all
    elsif user.client?
      can :manage, Post, user_id: user.id
      can :read, :all
    else
      can :read, :all
    end
    can :access, :ckeditor   # needed to access Ckeditor filebrowser
    can [:read, :create, :destroy], Ckeditor::Picture
    can [:read, :create, :destroy], Ckeditor::AttachmentFile
  end
end
