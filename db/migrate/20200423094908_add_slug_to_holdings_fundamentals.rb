class AddSlugToHoldingsFundamentals < ActiveRecord::Migration[6.0]
  def change
    add_column :holdings_fundamentals, :slug, :string
    add_index :holdings_fundamentals, :slug, unique: true
  end
end
