class RemoveMoodFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :mood, :boolean
  end
end
