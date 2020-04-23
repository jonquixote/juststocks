class CreateStrategySummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :strategy_summaries do |t|
      t.string :summary_link
      t.string :summary_link_href
      t.string :info_name
      t.string :info_value
      t.string :strategy_name
      t.bigint :strategy_id

      t.timestamps
    end
  end
end
