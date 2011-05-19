class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    if user.role? :reseller
      can :read, [IosQuote, MacQuote]
      can :create, [IosQuote, MacQuote]
      can :update, IosQuote do |ios_quote|
      end
      ios_quote.try(:user) == user
    end
    can :update, MacQuote do |mac_quote|
      mac_quote.try(:user) == user
    end
    if user.role? :admin
      can :manage, :all
    end
  
    if user.role? :staff
      can :update, [IosQuote, MacQuote, Company, Client, AdhocSupport]
      can :destroy, [IosQuote, MacQuote, Company, Client, AdhocSupport]
      can :create, [IosQuote, MacQuote, Company, Client, AdhocSupport]
      can :read, [Company, Client, AdhocSupport]
    end
  end   
end