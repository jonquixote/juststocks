class AddIndexToCharts < ActiveRecord::Migration[6.0]
  def change
    add_index :charts, :strategy_id
  end
end
