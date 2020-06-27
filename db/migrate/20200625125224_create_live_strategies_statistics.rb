class CreateLiveStrategiesStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :live_strategies_statistics do |t|
      t.string :name
      t.string :annual
      t.string :dDown
      t.string :stdDev
      t.string :sharpeRatio
      t.string :sortinoRatio
      t.string :benchmarkCorrel
      t.string :alpha
      t.string :realizedWinners
      t.string :annualTurnover

      t.timestamps
    end
  end
end
