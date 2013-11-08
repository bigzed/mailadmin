require 'spec_helper'

describe VirtualUser do
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  
end
