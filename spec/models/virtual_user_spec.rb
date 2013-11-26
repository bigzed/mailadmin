require 'spec_helper'

describe VirtualUser do
  context 'without after validation' do
    # Somehow the specs don't work if the after_validation hook is active.
    before { VirtualUser.any_instance.stub(:construct_email).and_return(true) }

    it { should validate_uniqueness_of(:name).scoped_to(:virtual_domain_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should belong_to(:virtual_domain) }
  end

  describe '.email for convenience' do
    subject(:steved) { FactoryGirl.create(:steved_at_obstkiste_org) }

    its(:email) { should eq("#{steved.name}@#{steved.virtual_domain.name}") }
  end
end
