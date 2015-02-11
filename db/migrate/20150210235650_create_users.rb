class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :username
      t.text :password
      t.references :user_tale

      t.timestamps null: false
    end

  end
end
