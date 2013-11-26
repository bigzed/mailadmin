class AddSourceToVirtualAlias < ActiveRecord::Migration
  def change
    add_column :virtual_aliases, :source, :string
  end
end
