class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    can :read, [IosQuote, SupportQuote, InstallQuote]
    can :create, [IosQuote, SupportQuote, InstallQuote]
    can :update, IosQuote do |ios_quote|
      ios_quote.try(:user) == user
    end
    can :update, SupportQuote do |support_quote|
      support_quote.try(:user) == user
    end
    can :update, InstallQuote do |install_quote|
      support_quote.try(:user) == user
    end
    if user.role? :admin
      can :manage, :all
    end
    
    if user.role? :staff
      can :update, [IosQuote, SupportQuote, InstallQuote, Company, Client, AdhocSupport]
      can :destroy, [IosQuote, SupportQuote, InstallQuote, Company, Client, AdhocSupport]
      can :create, [IosQuote, SupportQuote, InstallQuote, Company, Client, AdhocSupport]
      can :read, [Company, Client, AdhocSupport]
    end
  end   
end