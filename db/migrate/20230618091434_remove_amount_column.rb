class RemoveAmountColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :amount
    remove_column :cards, :amount
    remove_column :transactions, :client_amount
    remove_column :transactions, :merchant_amount
  end
end
