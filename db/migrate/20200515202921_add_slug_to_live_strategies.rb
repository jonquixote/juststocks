class AddSlugToLiveStrategies < ActiveRecord::Migration[6.0]
  def change
    add_column :live_strategies, :slug, :string
    add_index :live_strategies, :slug, unique: true
  end
end
