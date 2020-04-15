class CreateHoldingsReturns < ActiveRecord::Migration[6.0]
  def change
    create_table :holdings_returns do |t|
      t.string :return_link
      t.string :return_link_href
      t.string :ticker
      t.string :one_day
      t.string :last_close
      t.string :change
      t.string :weight_return
      t.string :one_week
      t.string :four_weeks
      t.string :eight_weeks
      t.string :thirteen_weeks

      t.timestamps
    end
  end
end
