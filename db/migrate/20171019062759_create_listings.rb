class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :content
      t.string :category
      t.string :area
      t.string :format
      t.string :budget
      t.string :deadline
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
