class AddIndexToHoldingsReturns < ActiveRecord::Migration[6.0]
  def change
    add_index :holdings_returns, :strategy_id
  end
end
