class ChangeColumnAccessToBeMoreReadable < ActiveRecord::Migration
  def change
    rename_column :tales, :access, :public_access
  end
end
