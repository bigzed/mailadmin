require 'spec_helper'

describe VirtualDomain do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:virtual_user) }
  it { should have_many(:virtual_alias) }

  describe '.name' do
    it 'validates format of domain'
  end

  describe 'relationship' do
    before { FactoryGirl.create(:steved_at_obstkiste_org) }
    after { VirtualUser.delete_all}

    describe 'to virtual_user' do
      context 'when domain is destroyed' do
        before { VirtualDomain.first.destroy }

        it 'destroys also the user' do
          expect(VirtualUser.all).to be_empty
        end
      end
    end
  end
end
