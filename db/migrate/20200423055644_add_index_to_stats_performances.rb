class AddIndexToStatsPerformances < ActiveRecord::Migration[6.0]
  def change
    add_index :stats_performances, :strategy_id
  end
end
