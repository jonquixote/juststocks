class CreateCharts < ActiveRecord::Migration[6.0]
  def change
    create_table :charts do |t|
      t.string :date
      t.float :return
      t.float :bench_return
      t.string :strategy_name
	  t.bigint :strategy_id

      t.timestamps
    end
  end
end
