class CreateRiskMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :risk_measurements do |t|
      t.string :risk_measurements_stats_link
      t.string :risk_measurements_stats_link_href
      t.string :risk_name
      t.string :model_risk
      t.string :snp_500_spy_risk
      t.string :strategy_name
      t.string :strategy_id

      t.timestamps
    end
  end
end
