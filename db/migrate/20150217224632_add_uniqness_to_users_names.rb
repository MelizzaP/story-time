class AddUniqnessToUsersNames < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, unique: true
  end
end
