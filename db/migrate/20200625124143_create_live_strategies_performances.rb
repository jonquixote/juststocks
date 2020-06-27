class CreateLiveStrategiesPerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :live_strategies_performances do |t|
      t.string :name
      t.string :annual
      t.string :annualBench
      t.string :ytd
      t.string :benchYtd
      t.string :oneYear
      t.string :benchOneYear
      t.string :totRet
      t.string :benchRet
      t.string :oneDay
      t.string :oneWeek
      t.string :fourWeeks
      t.string :thirteenWeeks
      t.string :twentySixWeeks

      t.timestamps
    end
  end
end
