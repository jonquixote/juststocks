class AddSlugToStrategySummaryStats < ActiveRecord::Migration[6.0]
  def change
    add_column :strategy_summary_stats, :slug, :string
    add_index :strategy_summary_stats, :slug, unique: true
  end
end
