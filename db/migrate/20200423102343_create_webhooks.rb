class CreateWebhooks < ActiveRecord::Migration[6.0]
  def change
    create_table :webhooks do |t|
      t.bigint :scrapingjob_id
      t.string :status
      t.bigint :sitemap_id
      t.string :sitemap_name

      t.timestamps
    end
  end
end
