require 'spec_helper'

describe VirtualAlias do
  it { should validate_uniqueness_of(:source) }
  it { should validate_presence_of(:source) }
  it { should belong_to(:virtual_user) }
  
end
