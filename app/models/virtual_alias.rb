class VirtualAlias < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {scope: :virtual_domain_id}
  validates :virtual_domain_id, presence: true
  validates :destination, presence: true
  
  belongs_to :virtual_domain

  after_validation :construct_source

private
  # For convenience purpose in configuring Postfix
  # we construct the email address and save it to DB.
  def construct_source
    self.source = "#{name}@#{virtual_domain.name}"
  end
end
