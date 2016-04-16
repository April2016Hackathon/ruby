class SetChosenDefaultInResponses < ActiveRecord::Migration
  def change
    change_column_default :responses, :chosen, false
  end
end
