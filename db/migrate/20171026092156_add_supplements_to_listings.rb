class AddSupplementsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :solution, :boolean
    add_column :listings, :line, :date
    add_column :listings, :start_budget, :integer
    add_column :listings, :end_budget, :integer
  end
end
