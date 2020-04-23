class AddIndexToStrategyTradingStats < ActiveRecord::Migration[6.0]
  def change
    add_index :strategy_trading_stats, :strategy_id
  end
end
