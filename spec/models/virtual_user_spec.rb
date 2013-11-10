require 'spec_helper'

describe VirtualUser do
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should belong_to(:virtual_domain) }
  it { should have_many(:virtual_alias) }

  describe 'relationship' do
    before { FactoryGirl.create(:kiwi_alias) }

    describe 'to virtual_alias' do
      context 'when user is destroyed' do
        before { VirtualUser.first.destroy }

        it 'destroys also the alias' do
          expect(VirtualAlias.all).to be_empty
        end
      end
    end
  end
end
