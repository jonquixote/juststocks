class AddSlugToStrategySummaries < ActiveRecord::Migration[6.0]
  def change
    add_column :strategy_summaries, :slug, :string
    add_index :strategy_summaries, :slug, unique: true
  end
end
