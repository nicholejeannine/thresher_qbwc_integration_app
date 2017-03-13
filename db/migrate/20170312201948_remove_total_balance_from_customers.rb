class RemoveTotalBalanceFromCustomers < ActiveRecord::Migration[5.0]
  def up
    remove_column :customers, :total_balance
  end

  def down
   add_column :customers, :total_balance, :decimal, precision: 20, scale: 2
  end
end
