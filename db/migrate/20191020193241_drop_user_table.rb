class DropUserTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :users do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :type, null: false
      t.timestamps null: false
    end
  end
end
