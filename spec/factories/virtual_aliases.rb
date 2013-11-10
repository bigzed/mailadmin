FactoryGirl.define do
  factory :johnalias, class: VirtualAlias do
    source "johndoe@example.com"
    destination "jon@example.com"
  end

  factory :kiwi_alias, class: VirtualAlias do
    source 'kiwi@obstkiste.org'
    association :virtual_user, factory: :steved_at_obstkiste_org
  end
end
