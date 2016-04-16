class Setnulltofalseforchoseninresponses < ActiveRecord::Migration
  def change
  	change_column :responses, :chosen, :boolean, :null => false
  end
end
