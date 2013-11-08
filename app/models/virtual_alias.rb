class VirtualAlias < ActiveRecord::Base
  validates :source, presence: true
  validates :destination, presence: true, uniqueness: { scope: :source }
end
