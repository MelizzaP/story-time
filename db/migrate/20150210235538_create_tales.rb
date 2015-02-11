class CreateTales < ActiveRecord::Migration
  def change
    create_table :tales do |t|
      t.text :inspiration
      t.text :type
      t.boolean :private
      t.text :content
      t.text :title
      t.references :user_tale

      t.timestamps null: false
    end
  end
end
