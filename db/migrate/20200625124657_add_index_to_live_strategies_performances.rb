class AddIndexToLiveStrategiesPerformances < ActiveRecord::Migration[6.0]
  def change
    add_index :live_strategies_performances, :name
  end
end
