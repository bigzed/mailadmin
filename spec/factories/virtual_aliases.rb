FactoryGirl.define do
  factory :kiwi_alias, class: VirtualAlias do
    name "kiwi"
    destination 'steved@obstkiste.org'
    association :virtual_domain, factory: :obstkiste_org
  end
end
