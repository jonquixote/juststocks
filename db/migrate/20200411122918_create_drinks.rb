class CreateDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks do |t|
      t.string :product
      t.string :category
      t.integer :rating

      t.timestamps
    end
  end
end
