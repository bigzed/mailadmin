class VirtualAlias < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {scope: :virtual_domain_id}
  validates :virtual_domain_id, presence: true
  validates :virtual_user_id, presence: true, uniqueness:{scope: :name}
  
  belongs_to :virtual_user
  belongs_to :virtual_domain
end
