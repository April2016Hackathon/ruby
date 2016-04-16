class Changerankingtorankid < ActiveRecord::Migration
  def change
  	add_column :users, :rank_id, :integer, :default => 1
  	remove_column :users, :ranking, :integer
  end
end
