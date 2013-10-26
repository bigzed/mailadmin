FactoryGirl.define do
  factory :johndoe, class: VirtualUser do
    email "johndoe@example.com"
    password "{SSHA}Ak6YMDROTBvM4ZZ0aLv87L3LpyKzxgba"
  end
end
