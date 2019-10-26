class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :receiver
      t.boolean :refunded
      t.boolean :completed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
