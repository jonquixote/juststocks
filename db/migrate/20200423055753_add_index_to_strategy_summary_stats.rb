class AddIndexToStrategySummaryStats < ActiveRecord::Migration[6.0]
  def change
    add_index :strategy_summary_stats, :strategy_id
  end
end
