class CreateVirtualAliases < ActiveRecord::Migration
  def change
    create_table :virtual_aliases do |t|
      t.string :name
      t.integer :virtual_domain_id
      t.integer :virtual_user_id

      t.timestamps
    end
  end
end
