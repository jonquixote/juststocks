class AddSlugToStatsPerformances < ActiveRecord::Migration[6.0]
  def change
    add_column :stats_performances, :slug, :string
    add_index :stats_performances, :slug, unique: true
  end
end
