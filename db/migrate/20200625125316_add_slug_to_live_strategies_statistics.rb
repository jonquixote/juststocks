class AddSlugToLiveStrategiesStatistics < ActiveRecord::Migration[6.0]
  def change
    add_column :live_strategies_statistics, :slug, :string
    add_index :live_strategies_statistics, :slug, unique: true
  end
end
