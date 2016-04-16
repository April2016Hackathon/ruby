class AddMoodToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :mood, :boolean
  end
end
