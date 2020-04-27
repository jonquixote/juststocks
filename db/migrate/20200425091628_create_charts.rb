class CreateCharts < ActiveRecord::Migration[6.0]
  def change
    create_table :charts do |t|
      t.datetime :date
      t.string :cash
      t.string :long_mkt_value
      t.string :short_mkt_value
      t.string :hedge_mkt_value
      t.string :cash_added
      t.string :total_equity
      t.string :accrued_dividends
      t.float :leverage_ratio
      t.float :positions
      t.float :spy
      t.float :return
      t.float :bench_return
      t.string :strategy_name

      t.timestamps
    end
  end
end
