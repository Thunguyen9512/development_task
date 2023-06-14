class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.boolean :active, default: true
      t.string :name
      t.integer :country_id
      t.decimal :paypout_rate, precision: 5, scale: 2, default: 0

      t.timestamps
    end
  end
end
