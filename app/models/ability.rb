class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    
    if user.role?(:admin)
      can :manage, :all
    else
      can :read, IosQuote
      can :create, IosQuote
      can :update, IosQuote do |ios_quote|
        ios_quote.try(:user) == user || user.role?(:staff)
      end
      can :read, InstallQuote
      can :create, InstallQuote
      can :update, InstallQuote do |install_quote|
        install_quote.try(:user) == user || user.role?(:staff)
      end
      can :read, SupportQuote
      can :create, SupportQuote
      can :update, SupportQuote do |support_quote|
        support_quote.try(:user) == user || user.role?(:staff)
      end
      if user.role?(:staff)
          can :update, :all
          can :destroy, IosQuote
          can :destroy, SupportQuote
      end
    end
  end
end