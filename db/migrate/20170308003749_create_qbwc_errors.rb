class CreateQbwcErrors < ActiveRecord::Migration[5.0]
  def change
    create_table :qbwc_errors do |t|
      t.string :worker_class, :null => false
      t.string :model_id
      t.text :error_message

      t.timestamps null: false
    end
  end
end
