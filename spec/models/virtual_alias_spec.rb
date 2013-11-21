require 'spec_helper'

describe VirtualAlias do
  it { should validate_uniqueness_of(:name).scoped_to(:virtual_domain_id) }
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:virtual_domain_id)}
  it { should validate_uniqueness_of(:virtual_user_id).scoped_to(:name) }
  it { should validate_presence_of(:virtual_user_id) }
  
end
