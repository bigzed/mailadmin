require 'spec_helper'

describe VirtualUser do
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should belong_to(:virtual_domain) }
  it { should have_many(:virtual_alias) }

  
end
