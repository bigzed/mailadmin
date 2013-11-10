require 'spec_helper'

describe VirtualDomain do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:virtual_user) }

  describe 'name' do
    it 'validates format of domain'
  end
end
