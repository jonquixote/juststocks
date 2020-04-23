class CreateStatsPerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :stats_performances do |t|
      t.string :statistics_link
      t.string :statistics_link_href
      t.string :return_pct
      t.string :model
      t.string :snp_500_spy
      t.string :twenty_twenty_01
      t.string :twenty_twenty_02
      t.string :twenty_twenty_03
      t.string :twenty_twenty_04
      t.string :twenty_twenty_05
      t.string :twenty_twenty_06
      t.string :twenty_twenty_07
      t.string :twenty_twenty_08
      t.string :twenty_twenty_09
      t.string :twenty_twenty_10
      t.string :twenty_twenty_11
      t.string :twenty_twenty_12
      t.string :strategy_name
      t.bigint :strategy_id

      t.timestamps
    end
  end
end
