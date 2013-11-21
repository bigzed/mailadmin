class CreateVirtualUsers < ActiveRecord::Migration
  def change
    create_table :virtual_users do |t|
      t.string :name
      t.string :password
      t.integer :virtual_domain_id

      t.timestamps
    end
  end
end
