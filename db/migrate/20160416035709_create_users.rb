class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.boolean :mood
      t.integer :wildpoints
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
