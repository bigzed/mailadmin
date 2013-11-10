FactoryGirl.define do
  factory :john_doe_at_example_com, class: VirtualUser do
    email 'johndoe@example.com'
    password '{SHA512-CRYPT}$6$skzTG4mgNwiAw1Gn$kgdSGTj49kFlrEv.KaiNJIWCRsqKhbhYPaO.SAwEy1FS2LyeqiSEvV8H6zoORuSXQLStX87r5XrS.uiF1eN2F0'
  end

  factory :steved_at_obstkiste_org, class: VirtualUser do
    email 'steved@obstkiste.org'
    password '{SHA512-CRYPT}$6$skzTG4mgNwiAw1Gn$kgdSGTj49kFlrEv.KaiNJIWCRsqKhbhYPaO.SAwEy1FS2LyeqiSEvV8H6zoORuSXQLStX87r5XrS.uiF1eN2F0'
    association :virtual_domain, factory: :obstkiste_org
  end
end
