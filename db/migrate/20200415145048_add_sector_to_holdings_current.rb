class AddSectorToHoldingsCurrent < ActiveRecord::Migration[6.0]
  def change
    add_column :holdings_currents, :sector, :string
    add_column :holdings_currents, :strategy_id, :bigint
  end
end
