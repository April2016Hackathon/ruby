class Setwildpointdefaultinusers < ActiveRecord::Migration
  def change
  	change_column_default :users, :wildpoints, 0
  end
end
