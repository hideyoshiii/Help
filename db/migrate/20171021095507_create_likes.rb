class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user_id, foreign_key: true
      t.references :listing_id, foreign_key: true

      t.timestamps
    end
  end
end
