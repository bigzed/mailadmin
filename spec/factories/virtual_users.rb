FactoryGirl.define do
  factory :john_doe, class: VirtualUser do
    email 'johndoe@example.com'
    password 'password'
  end
end
