class AddIndexToHoldingsFundamentals < ActiveRecord::Migration[6.0]
  def change
    add_index :holdings_fundamentals, :strategy_id
  end
end
