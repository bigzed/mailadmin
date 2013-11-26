class AddDestinationToVirtualAliases < ActiveRecord::Migration
  def change
    add_column :virtual_aliases, :destination, :string
    remove_column :virtual_aliases, :virtual_user_id
  end
end
