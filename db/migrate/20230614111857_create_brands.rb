class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.boolean :active, default: true
      t.string :name
      t.text :description
      t.integer :redemption, default: 0
      t.integer :merchant_id

      t.timestamps
    end
  end
end
