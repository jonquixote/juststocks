class AddIndexToHoldingsCurrent < ActiveRecord::Migration[6.0]
  def change
    add_index :holdings_currents, :strategy_id
  end
end
