class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :status, default: 0
      t.integer :product_id
      t.decimal :amount, precision: 10, scale: 2
      t.string :activation_number

      t.timestamps
    end
  end
end
