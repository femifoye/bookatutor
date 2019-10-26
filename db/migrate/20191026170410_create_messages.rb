class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :message_to
      t.string :message_from
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
