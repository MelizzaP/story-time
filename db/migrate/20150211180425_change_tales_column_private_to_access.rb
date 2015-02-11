class ChangeTalesColumnPrivateToAccess < ActiveRecord::Migration
  def change
    rename_column :tales, :private, :access
  end
end
