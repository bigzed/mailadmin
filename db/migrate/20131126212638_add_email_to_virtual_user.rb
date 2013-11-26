class AddEmailToVirtualUser < ActiveRecord::Migration
  def change
    add_column :virtual_users, :email, :string
  end
end
