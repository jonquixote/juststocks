require 'test_helper'

class StrategiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @strategy = strategies(:one)
  end

  test "should get index" do
    get strategies_url, as: :json
    assert_response :success
  end

  test "should create strategy" do
    assert_difference('Strategy.count') do
      post strategies_url, params: { strategy: { avg_share_cost: @strategy.avg_share_cost, change: @strategy.change, charts_link: @strategy.charts_link, charts_link_href: @strategy.charts_link_href, cost: @strategy.cost, current_price: @strategy.current_price, days_held: @strategy.days_held, eight_weeks: @strategy.eight_weeks, four_weeks: @strategy.four_weeks, fundamental_link: @strategy.fundamental_link, fundamental_link_href: @strategy.fundamental_link_href, historical_link: @strategy.historical_link, historical_link_href: @strategy.historical_link_href, info_name: @strategy.info_name, info_value: @strategy.info_value, last_close: @strategy.last_close, market_cap: @strategy.market_cap, model: @strategy.model, model_risk: @strategy.model_risk, number_of_days: @strategy.number_of_days, one_day: @strategy.one_day, one_week: @strategy.one_week, open_date: @strategy.open_date, p_e: @strategy.p_e, pct_historical: @strategy.pct_historical, peg: @strategy.peg, pr2cfl_per_shr_ttm: @strategy.pr2cfl_per_shr_ttm, rank: @strategy.rank, realized_all: @strategy.realized_all, realized_losers: @strategy.realized_losers, realized_winners: @strategy.realized_winners, return: @strategy.return, return_dollars: @strategy.return_dollars, return_fundamental: @strategy.return_fundamental, return_link: @strategy.return_link, return_link_href: @strategy.return_link_href, return_pct: @strategy.return_pct, risk_measurements_stats_link: @strategy.risk_measurements_stats_link, risk_measurements_stats_link_href: @strategy.risk_measurements_stats_link_href, risk_name: @strategy.risk_name, roe_ttm: @strategy.roe_ttm, roi_ttm: @strategy.roi_ttm, sector: @strategy.sector, shares: @strategy.shares, snp_500_spy: @strategy.snp_500_spy, snp_500_spy_risk: @strategy.snp_500_spy_risk, statistics_link: @strategy.statistics_link, statistics_link_href: @strategy.statistics_link_href, stats_name: @strategy.stats_name, stats_value: @strategy.stats_value, summary_link: @strategy.summary_link, summary_link_href: @strategy.summary_link_href, thirteen_weeks: @strategy.thirteen_weeks, ticker: @strategy.ticker, tot_debt_to_eq_ratio: @strategy.tot_debt_to_eq_ratio, total: @strategy.total, trading_names: @strategy.trading_names, trading_statistics_link: @strategy.trading_statistics_link, trading_statistics_link_href: @strategy.trading_statistics_link_href, trading_summary_names: @strategy.trading_summary_names, trading_values: @strategy.trading_values, twenty_twenty_01: @strategy.twenty_twenty_01, twenty_twenty_02: @strategy.twenty_twenty_02, twenty_twenty_03: @strategy.twenty_twenty_03, twenty_twenty_04: @strategy.twenty_twenty_04, twenty_twenty_05: @strategy.twenty_twenty_05, twenty_twenty_06: @strategy.twenty_twenty_06, twenty_twenty_07: @strategy.twenty_twenty_07, twenty_twenty_08: @strategy.twenty_twenty_08, twenty_twenty_09: @strategy.twenty_twenty_09, twenty_twenty_10: @strategy.twenty_twenty_10, twenty_twenty_11: @strategy.twenty_twenty_11, twenty_twenty_12: @strategy.twenty_twenty_12, unrealized_all: @strategy.unrealized_all, unrealized_losers: @strategy.unrealized_losers, unrealized_winners: @strategy.unrealized_winners, value: @strategy.value, web_scraper_order: @strategy.web_scraper_order, web_scraper_start_url: @strategy.web_scraper_start_url, weight: @strategy.weight, weight_return: @strategy.weight_return, yield: @strategy.yield } }, as: :json
    end

    assert_response 201
  end

  test "should show strategy" do
    get strategy_url(@strategy), as: :json
    assert_response :success
  end

  test "should update strategy" do
    patch strategy_url(@strategy), params: { strategy: { avg_share_cost: @strategy.avg_share_cost, change: @strategy.change, charts_link: @strategy.charts_link, charts_link_href: @strategy.charts_link_href, cost: @strategy.cost, current_price: @strategy.current_price, days_held: @strategy.days_held, eight_weeks: @strategy.eight_weeks, four_weeks: @strategy.four_weeks, fundamental_link: @strategy.fundamental_link, fundamental_link_href: @strategy.fundamental_link_href, historical_link: @strategy.historical_link, historical_link_href: @strategy.historical_link_href, info_name: @strategy.info_name, info_value: @strategy.info_value, last_close: @strategy.last_close, market_cap: @strategy.market_cap, model: @strategy.model, model_risk: @strategy.model_risk, number_of_days: @strategy.number_of_days, one_day: @strategy.one_day, one_week: @strategy.one_week, open_date: @strategy.open_date, p_e: @strategy.p_e, pct_historical: @strategy.pct_historical, peg: @strategy.peg, pr2cfl_per_shr_ttm: @strategy.pr2cfl_per_shr_ttm, rank: @strategy.rank, realized_all: @strategy.realized_all, realized_losers: @strategy.realized_losers, realized_winners: @strategy.realized_winners, return: @strategy.return, return_dollars: @strategy.return_dollars, return_fundamental: @strategy.return_fundamental, return_link: @strategy.return_link, return_link_href: @strategy.return_link_href, return_pct: @strategy.return_pct, risk_measurements_stats_link: @strategy.risk_measurements_stats_link, risk_measurements_stats_link_href: @strategy.risk_measurements_stats_link_href, risk_name: @strategy.risk_name, roe_ttm: @strategy.roe_ttm, roi_ttm: @strategy.roi_ttm, sector: @strategy.sector, shares: @strategy.shares, snp_500_spy: @strategy.snp_500_spy, snp_500_spy_risk: @strategy.snp_500_spy_risk, statistics_link: @strategy.statistics_link, statistics_link_href: @strategy.statistics_link_href, stats_name: @strategy.stats_name, stats_value: @strategy.stats_value, summary_link: @strategy.summary_link, summary_link_href: @strategy.summary_link_href, thirteen_weeks: @strategy.thirteen_weeks, ticker: @strategy.ticker, tot_debt_to_eq_ratio: @strategy.tot_debt_to_eq_ratio, total: @strategy.total, trading_names: @strategy.trading_names, trading_statistics_link: @strategy.trading_statistics_link, trading_statistics_link_href: @strategy.trading_statistics_link_href, trading_summary_names: @strategy.trading_summary_names, trading_values: @strategy.trading_values, twenty_twenty_01: @strategy.twenty_twenty_01, twenty_twenty_02: @strategy.twenty_twenty_02, twenty_twenty_03: @strategy.twenty_twenty_03, twenty_twenty_04: @strategy.twenty_twenty_04, twenty_twenty_05: @strategy.twenty_twenty_05, twenty_twenty_06: @strategy.twenty_twenty_06, twenty_twenty_07: @strategy.twenty_twenty_07, twenty_twenty_08: @strategy.twenty_twenty_08, twenty_twenty_09: @strategy.twenty_twenty_09, twenty_twenty_10: @strategy.twenty_twenty_10, twenty_twenty_11: @strategy.twenty_twenty_11, twenty_twenty_12: @strategy.twenty_twenty_12, unrealized_all: @strategy.unrealized_all, unrealized_losers: @strategy.unrealized_losers, unrealized_winners: @strategy.unrealized_winners, value: @strategy.value, web_scraper_order: @strategy.web_scraper_order, web_scraper_start_url: @strategy.web_scraper_start_url, weight: @strategy.weight, weight_return: @strategy.weight_return, yield: @strategy.yield } }, as: :json
    assert_response 200
  end

  test "should destroy strategy" do
    assert_difference('Strategy.count', -1) do
      delete strategy_url(@strategy), as: :json
    end

    assert_response 204
  end
end
