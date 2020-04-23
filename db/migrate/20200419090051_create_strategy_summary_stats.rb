class CreateStrategySummaryStats < ActiveRecord::Migration[6.0]
  def change
    create_table :strategy_summary_stats do |t|
      t.string :summary_link
      t.string :summary_link_href
      t.string :stats_name
      t.string :stats_value
      t.string :strategy_name
      t.bigint :strategy_id

      t.timestamps
    end
  end
end
