# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_23_102343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "drinks", force: :cascade do |t|
    t.string "product"
    t.string "category"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "holdings_currents", force: :cascade do |t|
    t.string "ticker"
    t.string "weight"
    t.string "return"
    t.string "return_dollars"
    t.string "rank"
    t.integer "shares"
    t.string "avg_share_cost"
    t.string "current_price"
    t.string "value"
    t.integer "days_held"
    t.string "sector"
    t.string "strategy_name"
    t.string "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_holdings_currents_on_slug", unique: true
    t.index ["strategy_id"], name: "index_holdings_currents_on_strategy_id"
  end

  create_table "holdings_fundamentals", force: :cascade do |t|
    t.string "fundamental_link"
    t.string "fundamental_link_href"
    t.string "ticker"
    t.string "return_fundamental"
    t.string "market_cap"
    t.string "yield"
    t.string "p_e"
    t.string "peg"
    t.string "roe_ttm"
    t.string "roi_ttm"
    t.float "tot_debt_to_eq_ratio"
    t.string "pr2cfl_per_shr_ttm"
    t.string "strategy_name"
    t.string "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_holdings_fundamentals_on_slug", unique: true
    t.index ["strategy_id"], name: "index_holdings_fundamentals_on_strategy_id"
  end

  create_table "holdings_historicals", force: :cascade do |t|
    t.string "historical_link"
    t.string "historical_link_href"
    t.string "ticker"
    t.string "cost"
    t.string "open_date"
    t.string "number_of_days"
    t.string "pct_historical"
    t.string "strategy_name"
    t.bigint "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_holdings_historicals_on_slug", unique: true
    t.index ["strategy_id"], name: "index_holdings_historicals_on_strategy_id"
  end

  create_table "holdings_returns", force: :cascade do |t|
    t.string "return_link"
    t.string "return_link_href"
    t.string "ticker"
    t.string "one_day"
    t.string "last_close"
    t.string "change"
    t.string "weight_return"
    t.string "one_week"
    t.string "four_weeks"
    t.string "eight_weeks"
    t.string "thirteen_weeks"
    t.string "strategy_name"
    t.string "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_holdings_returns_on_slug", unique: true
    t.index ["strategy_id"], name: "index_holdings_returns_on_strategy_id"
  end

  create_table "risk_measurements", force: :cascade do |t|
    t.string "risk_measurements_stats_link"
    t.string "risk_measurements_stats_link_href"
    t.string "risk_name"
    t.string "model_risk"
    t.string "snp_500_spy_risk"
    t.string "strategy_name"
    t.string "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_risk_measurements_on_slug", unique: true
    t.index ["strategy_id"], name: "index_risk_measurements_on_strategy_id"
  end

  create_table "stats_performances", force: :cascade do |t|
    t.string "statistics_link"
    t.string "statistics_link_href"
    t.string "return_pct"
    t.string "model"
    t.string "snp_500_spy"
    t.string "twenty_twenty_01"
    t.string "twenty_twenty_02"
    t.string "twenty_twenty_03"
    t.string "twenty_twenty_04"
    t.string "twenty_twenty_05"
    t.string "twenty_twenty_06"
    t.string "twenty_twenty_07"
    t.string "twenty_twenty_08"
    t.string "twenty_twenty_09"
    t.string "twenty_twenty_10"
    t.string "twenty_twenty_11"
    t.string "twenty_twenty_12"
    t.string "strategy_name"
    t.string "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_stats_performances_on_slug", unique: true
    t.index ["strategy_id"], name: "index_stats_performances_on_strategy_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "company_name"
    t.string "description"
    t.float "last_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "strategies", force: :cascade do |t|
    t.string "web_scraper_order"
    t.string "web_scraper_start_url"
    t.string "ticker"
    t.string "weight"
    t.string "return"
    t.string "return_dollars"
    t.string "rank"
    t.string "shares"
    t.string "avg_share_cost"
    t.string "current_price"
    t.string "value"
    t.string "days_held"
    t.string "sector"
    t.string "return_link"
    t.string "return_link_href"
    t.string "fundamental_link"
    t.string "fundamental_link_href"
    t.string "one_day"
    t.string "last_close"
    t.string "change"
    t.string "weight_return"
    t.string "one_week"
    t.string "four_weeks"
    t.string "eight_weeks"
    t.string "thirteen_weeks"
    t.string "return_fundamental"
    t.string "market_cap"
    t.string "yield"
    t.string "p_e"
    t.string "peg"
    t.string "roe_ttm"
    t.string "roi_ttm"
    t.float "tot_debt_to_eq_ratio"
    t.string "pr2cfl_per_shr_ttm"
    t.string "historical_link"
    t.string "historical_link_href"
    t.string "cost"
    t.string "open_date"
    t.integer "number_of_days"
    t.string "pct_historical"
    t.string "summary_link"
    t.string "summary_link_href"
    t.string "info_name"
    t.string "info_value"
    t.string "stats_name"
    t.string "stats_value"
    t.string "statistics_link"
    t.string "statistics_link_href"
    t.string "return_pct"
    t.string "total"
    t.string "model"
    t.string "snp_500_spy"
    t.string "twenty_twenty_01"
    t.string "twenty_twenty_02"
    t.string "twenty_twenty_03"
    t.string "twenty_twenty_04"
    t.string "twenty_twenty_05"
    t.string "twenty_twenty_06"
    t.string "twenty_twenty_07"
    t.string "twenty_twenty_08"
    t.string "twenty_twenty_09"
    t.string "twenty_twenty_10"
    t.string "twenty_twenty_11"
    t.string "twenty_twenty_12"
    t.string "charts_link"
    t.string "charts_link_href"
    t.string "trading_statistics_link"
    t.string "trading_statistics_link_href"
    t.string "trading_values"
    t.string "trading_summary_names"
    t.string "trading_names"
    t.string "realized_all"
    t.string "realized_winners"
    t.string "realized_losers"
    t.string "unrealized_all"
    t.string "unrealized_winners"
    t.string "unrealized_losers"
    t.string "risk_measurements_stats_link"
    t.string "risk_measurements_stats_link_href"
    t.string "risk_name"
    t.string "model_risk"
    t.string "snp_500_spy_risk"
    t.string "strategy_name"
    t.string "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "strategy_summaries", force: :cascade do |t|
    t.string "summary_link"
    t.string "summary_link_href"
    t.string "info_name"
    t.string "info_value"
    t.string "strategy_name"
    t.string "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_strategy_summaries_on_slug", unique: true
    t.index ["strategy_id"], name: "index_strategy_summaries_on_strategy_id"
  end

  create_table "strategy_summary_stats", force: :cascade do |t|
    t.string "summary_link"
    t.string "summary_link_href"
    t.string "stats_name"
    t.string "stats_value"
    t.string "strategy_name"
    t.string "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_strategy_summary_stats_on_slug", unique: true
    t.index ["strategy_id"], name: "index_strategy_summary_stats_on_strategy_id"
  end

  create_table "strategy_trading_stats", force: :cascade do |t|
    t.string "trading_statistics_link"
    t.string "trading_statistics_link_href"
    t.string "trading_values"
    t.string "trading_summary_names"
    t.string "trading_names"
    t.string "realized_all"
    t.string "realized_winners"
    t.string "realized_losers"
    t.string "unrealized_all"
    t.string "unrealized_winners"
    t.string "unrealized_losers"
    t.string "strategy_name"
    t.string "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_strategy_trading_stats_on_slug", unique: true
    t.index ["strategy_id"], name: "index_strategy_trading_stats_on_strategy_id"
  end

  create_table "web_hooks", force: :cascade do |t|
    t.bigint "scrapingjob_id"
    t.string "status"
    t.bigint "sitemap_id"
    t.string "sitemap_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "webhooks", force: :cascade do |t|
    t.bigint "scrapingjob_id"
    t.string "status"
    t.bigint "sitemap_id"
    t.string "sitemap_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
