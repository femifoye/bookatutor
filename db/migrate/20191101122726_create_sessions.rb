class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.datetime :start
      t.datetime :end
      t.text :members
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
