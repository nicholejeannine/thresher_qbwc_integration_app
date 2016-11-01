class CreateCustomerHierarchies < ActiveRecord::Migration
  def change
    create_table :customer_hierarchies, id: false do |t|
      t.string :ancestor_id, null: false
      t.string :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :customer_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "customer_anc_desc_idx"

    add_index :customer_hierarchies, [:descendant_id],
      name: "customer_desc_idx"
  end
end
