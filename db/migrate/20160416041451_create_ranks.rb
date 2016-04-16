class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :title
      t.integer :value
      t.attachment :image

      t.timestamps null: false
    end
  end
end
