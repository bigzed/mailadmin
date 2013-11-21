require 'spec_helper'

describe VirtualUser do
  it { should validate_uniqueness_of(:name).scoped_to(:virtual_domain_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password) }
  it { should belong_to(:virtual_domain) }
  it { should have_many(:virtual_alias) }

end
