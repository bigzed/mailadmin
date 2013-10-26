FactoryGirl.define do
  factory :johnalias, class: VirtualAlias do
    source "johndoe@example.com"
    destination "jon@example.com"
  end
end
