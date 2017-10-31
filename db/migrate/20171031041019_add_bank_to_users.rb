class AddBankToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bank_name, :string
    add_column :users, :branch_name, :string
    add_column :users, :account_types, :string
    add_column :users, :account_number, :integer
    add_column :users, :account_holder, :string
  end
end
