class AddVirtualUserToVirtualAlias < ActiveRecord::Migration
  def change
    add_column :virtual_aliases, :virtual_user_id, :integer
  end
end
