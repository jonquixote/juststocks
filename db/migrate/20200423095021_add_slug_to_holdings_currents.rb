class AddSlugToHoldingsCurrents < ActiveRecord::Migration[6.0]
  def change
    add_column :holdings_currents, :slug, :string
    add_index :holdings_currents, :slug, unique: true
  end
end
