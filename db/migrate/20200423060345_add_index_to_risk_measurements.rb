class AddIndexToRiskMeasurements < ActiveRecord::Migration[6.0]
  def change
    add_index :risk_measurements, :strategy_id
  end
end
