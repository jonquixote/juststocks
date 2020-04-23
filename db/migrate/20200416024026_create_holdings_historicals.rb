class CreateHoldingsHistoricals < ActiveRecord::Migration[6.0]
  def change
    create_table :holdings_historicals do |t|
      t.string :historical_link
      t.string :historical_link_href
      t.string :ticker
      t.string :cost
      t.string :open_date
      t.string :number_of_days
      t.string :pct_historical
      t.string :strategy_name
      t.bigint :strategy_id

      t.timestamps
    end
  end
end
