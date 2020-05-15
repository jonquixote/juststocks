class CreateLiveStrategies < ActiveRecord::Migration[6.0]
  def change
    create_table :live_strategies do |t|
      t.string :name
      t.string :thype
      t.string :rank_system
      t.string :inception
      t.string :upDate
      t.string :rebal
      t.string :holdings
      t.string :annual
      t.string :sharpe_ratio
      t.string :d_down

      t.timestamps
    end
  end
end
