class AddListIdToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :list_id, :string
  end
end
