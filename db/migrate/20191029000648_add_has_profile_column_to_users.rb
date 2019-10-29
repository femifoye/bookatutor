class AddHasProfileColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :has_profile, :boolean, :default => false
  end
end
