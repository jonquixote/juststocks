class AddSlugToCharts < ActiveRecord::Migration[6.0]
  def change
    add_column :charts, :slug, :string
    add_index :charts, :slug, unique: true
  end
end
