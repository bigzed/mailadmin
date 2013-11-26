require 'spec_helper'

describe VirtualAlias do
  context 'without after validation' do
    # Somehow the specs don't work if the after_validation hook is active.
    before { VirtualAlias.any_instance.stub(:construct_source).and_return(true) } 
    it { should validate_uniqueness_of(:name).scoped_to(:virtual_domain_id) }
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:virtual_domain_id)}
    it { should validate_presence_of(:destination)}
  end
  
  describe '.source for convenience' do
    subject(:kiwi) { FactoryGirl.create(:kiwi_alias) }

    its(:source) { should eq("#{kiwi.name}@#{kiwi.virtual_domain.name}")}
  end
end
