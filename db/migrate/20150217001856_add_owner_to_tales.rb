class AddOwnerToTales < ActiveRecord::Migration
  def change
    add_column :tales, :owner_id, :integer
    add_column :tales, :complete, :boolean, default: false 
    add_column :user_tales, :counter, :integer, default: 0
  end
end
