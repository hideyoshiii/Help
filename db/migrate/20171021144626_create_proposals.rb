class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.text :proposal_content
      t.integer :proposal_price

      t.timestamps
    end
  end
end
