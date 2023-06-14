class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.boolean :active, default: true
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.integer :brand_id

      t.timestamps
    end
  end
end
