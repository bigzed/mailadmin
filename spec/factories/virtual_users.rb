FactoryGirl.define do
  factory :john_doe_at_example_com, class: VirtualUser do
    name 'johndoe'
    password 'testpassword'
    association :virtual_domain, factory: :example_com
  end

  factory :steved_at_obstkiste_org, class: VirtualUser do
    name 'steved'
    password 'testpassword'
    association :virtual_domain, factory: :obstkiste_org
  end
end
