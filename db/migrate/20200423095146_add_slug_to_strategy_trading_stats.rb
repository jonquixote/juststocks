class AddSlugToStrategyTradingStats < ActiveRecord::Migration[6.0]
  def change
    add_column :strategy_trading_stats, :slug, :string
    add_index :strategy_trading_stats, :slug, unique: true
  end
end
