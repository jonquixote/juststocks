class AddSlugToRiskMeasurements < ActiveRecord::Migration[6.0]
  def change
    add_column :risk_measurements, :slug, :string
    add_index :risk_measurements, :slug, unique: true
  end
end
