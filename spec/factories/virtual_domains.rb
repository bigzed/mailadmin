FactoryGirl.define do
  factory :example_com, class: VirtualDomain do
    name "example.com"
  end

  factory :malformed_com, class: VirtualDomain do
    name "malformedcom"
  end
end
