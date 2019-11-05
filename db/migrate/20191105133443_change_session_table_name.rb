class ChangeSessionTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :sessions, :lessons
  end
end
