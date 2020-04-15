class AddStrategyNameToStrategy < ActiveRecord::Migration[6.0]
  def change
    add_column :strategies, :strategy_name, :string
  end
end
