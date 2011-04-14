class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, IosQuote
      can :create, InstallQuote
      can :update, IosQuote do |ios_quote|
        ios_quote.try(:user) == user || user.role?(:staff)
      end
      can :update, InstallQuote do |mac_quote|
        mac_quote.try(:user) == user || user.role?(:staff)
      end
      if user.role?(:staff)
      end
    end
  end
  
end