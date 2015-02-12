class ChangeColumnNameTypeDueToErrors < ActiveRecord::Migration
  def change
    rename_column :tales, :type, :story_type
  end
end
