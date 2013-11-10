class VirtualUser < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  belongs_to :virtual_domain
  has_many :virtual_alias, dependent: :destroy
end
