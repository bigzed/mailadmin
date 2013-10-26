class VirtualDomain < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true, virtual_domain: true
end
