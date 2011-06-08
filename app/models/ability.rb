class Ability
  include CanCan::Ability
  
  def initialise(user)
    user ||=User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    else
      can :create, IosQuote
      can :create, MacQuote
      can :update, IosQuote do |ios_quote|
        ios_quote.try(:user) == user || user.role?(:staff)
      end
      can :read, IosQuote do |ios_quote|
        ios_quote.try(:user) == user || user.role?(:staff)
      end
      can :update, MacQuote do |mac_quote|
        mac_quote.try(:user) == user || user.role?(:staff)
      end
      can :read, MacQuote do |mac_quote|
        mac_quote.try(:user) == user || user.role?(:staff)
      end
      if user.role?(:staff)
        can :manage, Client
        can :manage, Company
        can :manage, AdhocSupport
        can :manage, MacValue
        can :manage, IosValue
        can :manage, IosQuote
        can :manage, MacQuote
      end
    end
  end
end