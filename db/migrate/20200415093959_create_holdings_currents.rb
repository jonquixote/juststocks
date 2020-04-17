class CreateHoldingsCurrents < ActiveRecord::Migration[6.0]
  def change
    create_table :holdings_currents do |t|
      t.string :ticker
      t.string :weight
      t.string :return
      t.string :return_dollars
      t.string :rank
      t.integer :shares
      t.string :avg_share_cost
      t.string :current_price
      t.string :value
      t.integer :days_held
      t.string :sector
      t.string :strategy_name
      t.bigint :strategy_id

      t.timestamps
    end
  end
end
