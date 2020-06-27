class AddIndexToLiveStrategiesStatistics < ActiveRecord::Migration[6.0]
  def change
    add_index :live_strategies_statistics, :name
  end
end
