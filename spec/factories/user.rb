FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "account_#{n}@example.com"}
    sequence(:first_name) { |n| "John-#{n}"}
    last_name "Smith"
    password "12345678"
    password_confirmation {|a| a.password}
  end

  # factory :user do
  #   first_name "John"
  #   last_name  "Doe"
  #   email "john@example.com"
  # end
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   email "admin@example.com"
  # end
  # factory :reseller, class: User do
  #   first_name "Reseller"
  #   last_name "User"
  #   email "reseller@example.com"
  # end
end
