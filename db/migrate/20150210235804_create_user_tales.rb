class CreateUserTales < ActiveRecord::Migration
  def change
    create_table :user_tales do |t|
      t.references :user, index: true
      t.references :tale, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_tales, :users
    add_foreign_key :user_tales, :tales
  end
end
