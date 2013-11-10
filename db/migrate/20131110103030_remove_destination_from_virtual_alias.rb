class RemoveDestinationFromVirtualAlias < ActiveRecord::Migration
  def change
    remove_column :virtual_aliases, :destination
  end
end
