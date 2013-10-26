require 'spec_helper'

describe VirtualDomain do
  after(:each) do
    # Clean up
    VirtualDomain.delete_all
  end

  describe 'name' do
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
        @duplicate.save.should not_be
      end
    end

    context 'a malformed domain' do
      before(:each) do
        @malformed = FactoryGirl.build(:malformed_com)
      end
      it 'be rejected' do
        @malformed.save.should not_be
      end
    end
  end
end
