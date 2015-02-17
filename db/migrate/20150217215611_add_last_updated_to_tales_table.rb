class AddLastUpdatedToTalesTable < ActiveRecord::Migration
  def change
    add_column :tales, :last_user, :integer
  end
end
