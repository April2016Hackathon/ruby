class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.integer :user_id
      t.string :text
      t.string :title

      t.timestamps null: false
    end
  end
end
