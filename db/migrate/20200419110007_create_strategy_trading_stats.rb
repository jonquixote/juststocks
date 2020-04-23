class CreateStrategyTradingStats < ActiveRecord::Migration[6.0]
  def change
    create_table :strategy_trading_stats do |t|
      t.string :trading_statistics_link
      t.string :trading_statistics_link_href
      t.string :trading_values
      t.string :trading_summary_names
      t.string :trading_names
      t.string :realized_all
      t.string :realized_winners
      t.string :realized_losers
      t.string :unrealized_all
      t.string :unrealized_winners
      t.string :unrealized_losers
      t.string :strategy_name
      t.bigint :strategy_id

      t.timestamps
    end
  end
end
