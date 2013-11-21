class VirtualDomain < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true, virtual_domain: true

  has_many :virtual_user, dependent: :destroy
  has_many :virtual_alias, dependent: :destroy
end
