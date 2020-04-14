class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :company_name
      t.string :description
      t.float :last_price

      t.timestamps
    end
  end
end
