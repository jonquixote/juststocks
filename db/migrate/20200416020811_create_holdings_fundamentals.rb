class CreateHoldingsFundamentals < ActiveRecord::Migration[6.0]
  def change
    create_table :holdings_fundamentals do |t|
      t.string :fundamental_link
      t.string :fundamental_link_href
      t.string :ticker
      t.string :return_fundamental
      t.string :market_cap
      t.string :yield
      t.string :p_e
      t.string :peg
      t.string :roe_ttm
      t.string :roi_ttm
      t.float :tot_debt_to_eq_ratio
      t.string :pr2cfl_per_shr_ttm
      t.string :strategy_name
      t.bigint :strategy_id

      t.timestamps
    end
  end
end
