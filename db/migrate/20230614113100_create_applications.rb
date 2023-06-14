class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.boolean :active, default: true
      t.string :name
      t.integer :client_id
      t.string :uid
      t.string :secret
      
      t.timestamps
    end
  end
end
