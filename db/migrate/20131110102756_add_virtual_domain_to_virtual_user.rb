class AddVirtualDomainToVirtualUser < ActiveRecord::Migration
  def change
    add_column :virtual_users, :virtual_domain_id, :integer
  end
end
