require 'spec_helper'

describe VirtualAlias do
  it { should validate_uniqueness_of(:destination).scoped_to(:source) }
  it { should validate_presence_of(:destination) }
  it { should validate_presence_of(:source) }
end
