class AddSlugToHoldingsReturns < ActiveRecord::Migration[6.0]
  def change
    add_column :holdings_returns, :slug, :string
    add_index :holdings_returns, :slug, unique: true
  end
end
