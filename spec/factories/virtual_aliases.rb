FactoryGirl.define do
  factory :kiwi_alias, class: VirtualAlias do
    name "kiwi"
    association :virtual_user, factory: :steved_at_obstkiste_org
  end
end
