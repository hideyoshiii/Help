class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rate
      t.references :approval, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :reviewed_user_id

      t.timestamps
    end
  end
end
