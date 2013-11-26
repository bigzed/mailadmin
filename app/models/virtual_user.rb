class VirtualUser < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :virtual_domain }
  validates :password, presence: true

  belongs_to :virtual_domain

  after_validation :construct_email

private

  # For convenience purpose in configuring Postfix
  # we construct the email address and save it to DB.
  def construct_email
    self.email = "#{name}@#{virtual_domain.name}"
  end
end
