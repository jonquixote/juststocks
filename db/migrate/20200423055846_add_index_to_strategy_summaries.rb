class AddIndexToStrategySummaries < ActiveRecord::Migration[6.0]
  def change
    add_index :strategy_summaries, :strategy_id
  end
end
