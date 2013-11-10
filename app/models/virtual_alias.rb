class VirtualAlias < ActiveRecord::Base
  validates :source, presence: true, uniqueness: true
  
  belongs_to :virtual_user
end
