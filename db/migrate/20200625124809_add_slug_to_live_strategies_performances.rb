class AddSlugToLiveStrategiesPerformances < ActiveRecord::Migration[6.0]
  def change
    add_column :live_strategies_performances, :slug, :string
    add_index :live_strategies_performances, :slug, unique: true
  end
end
