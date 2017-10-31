class CreatePayouts < ActiveRecord::Migration[5.1]
  def change
    create_table :payouts do |t|
      t.integer :amount
      t.boolean :transfer
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
