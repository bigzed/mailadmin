class VirtualDomain < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true, virtual_domain: true

  has_many :virtual_user, dependent: :destroy
end
