class AddSlugToHoldingsHistoricals < ActiveRecord::Migration[6.0]
  def change
    add_column :holdings_historicals, :slug, :string
    add_index :holdings_historicals, :slug, unique: true
  end
end
