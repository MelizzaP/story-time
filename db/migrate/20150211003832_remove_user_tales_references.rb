class RemoveUserTalesReferences < ActiveRecord::Migration
  def change
    remove_column :users, :user_tale_id
    remove_column :tales, :user_tale_id
  end
end
