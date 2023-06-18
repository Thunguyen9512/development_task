class UpdateAmountColumnsToCurrency < ActiveRecord::Migration[7.0]
  def change
    add_monetize :products, :amount
    add_monetize :cards, :amount
    add_monetize :transactions, :client_amount
    add_monetize :transactions, :merchant_amount
  end
end
