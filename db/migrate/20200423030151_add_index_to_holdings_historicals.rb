class AddIndexToHoldingsHistoricals < ActiveRecord::Migration[6.0]
  def change
    add_index :holdings_historicals, :strategy_id
  end
end
