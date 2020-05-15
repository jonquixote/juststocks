class AddIndexToLiveStrategies < ActiveRecord::Migration[6.0]
  def change
    add_index :live_strategies, :strategy_id
  end
end
