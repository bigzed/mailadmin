require 'spec_helper'

describe VirtualDomain do
  after(:each) do
    # Clean up
    VirtualDomain.delete_all
  end

  describe 'name' do
    context 'an empty name' do
      it 'be rejected' do
        VirtualDomain.new.save.should_not be
      end
    end

    context 'a valid domain' do
      before(:each) do
        @domain = FactoryGirl.build(:example_com)
      end

      it 'be excepted' do
        @domain.save.should be
      end
    end

    context 'a duplicate domain' do
      before(:each) do
        FactoryGirl.create(:example_com)
        @duplicate = FactoryGirl.build(:example_com)
      end

      it 'be rejected' do
        @duplicate.save.should_not be
      end
    end

    context 'a malformed domain' do
      it 'be rejected'
    end
  end
end
