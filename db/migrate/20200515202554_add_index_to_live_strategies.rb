class AddIndexToLiveStrategies < ActiveRecord::Migration[6.0]
  def change
  	add_index :live_strategies, :name
  end
end
