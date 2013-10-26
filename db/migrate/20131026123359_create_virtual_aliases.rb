class CreateVirtualAliases < ActiveRecord::Migration
  def change
    create_table :virtual_aliases do |t|
      t.string :source
      t.string :destination

      t.timestamps
    end
  end
end