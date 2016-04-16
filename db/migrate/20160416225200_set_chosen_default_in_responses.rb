class SetChosenDefaultInResponses < ActiveRecord::Migration
  def change
    change_column_default :responses, :chosen, :default => false, :null => false
  end
end
