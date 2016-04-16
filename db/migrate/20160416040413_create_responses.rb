class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :posting_id
      t.string :text
      t.boolean :chosen

      t.timestamps null: false
    end
  end
end
