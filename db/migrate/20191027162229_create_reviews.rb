class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :reviewee
      t.string :review_content
      t.integer :review_stars
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
