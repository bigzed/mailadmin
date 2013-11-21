require 'securerandom'

class VirtualUser < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :virtual_domain }
  validates :password, presence: true

  belongs_to :virtual_domain
  has_many :virtual_alias, dependent: :destroy

  after_validation :encrypt_password

  private

    def encrypt_password
      # If we have doveadm create it with it otherwise use the build in 
      # SHA512-CRYPT from Ruby
      return if password.nil?
      self.password = `which doveadm &> /dev/null`.size.>(0) ? 
        `doveadm -s SHA512-CRYPT -p #{self.password}` : 
        self.password.crypt("$6$#{SecureRandom.hex}")
    end
end
