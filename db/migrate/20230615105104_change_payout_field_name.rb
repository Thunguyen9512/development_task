class ChangePayoutFieldName < ActiveRecord::Migration[7.0]
  def change
    rename_column :merchants, :paypout_rate, :payout_rate
    rename_column :clients, :paypout_rate, :payout_rate
  end
end
