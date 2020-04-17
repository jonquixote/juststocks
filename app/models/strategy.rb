class Strategy < ApplicationRecord
	has_one :holdings_current, :class_name => "HoldingsCurrent"
	has_one :holdings_return, :class_name => "HoldingsReturn"
	has_one :holdings_fundamental, :class_name => "HoldingsFundamental"
	has_one :holdings_historical, :class_name => "HoldingsHistorical"
	default_scope -> { order(created_at: :desc) }

	require 'active_support/all'
	require 'faraday'
	require 'json'

	webscraper_key = Rails.application.credentials.dig(:secret_key_webscraper)
	uri = URI('https://api.webscraper.io/api/v1/scraping-job/2064057/json?api_token=' + webscraper_key)
	res = Net::HTTP.get_response(uri)
	response = res.body

	# editor = JSON.parse(response.to_json).each_line do |zload|
	#   xload = JSON.parse(zload)
	#   value = JSON.parse(xload.to_json)
	#   strategy = Strategy.create(
 #  	    web_scraper_order: value["web-scraper-order"],
	#     strategy_name: value["web-scraper-start-url"]
	#    )
	# )
	# end
	# xload = JSON.parse(response.to_json)
	# yload = JSON.parse(xload)
	zload = JSON.parse(response.to_json)

	strategy = Strategy.create(
  	  web_scraper_order: zload["web-scraper-order"],
	  strategy_name: zload["web-scraper-start-url"]
	)

	  json = JSON.parse(response.to_json).each_line do |payload|
	  pload = JSON.parse(payload)
	  # pload.gsub('(http|https):\/\/www.portfolio123.com\/holdings.*', '')
  	  remove_nulls = pload.reject { |k, v| v == '' }
	  value = JSON.parse(remove_nulls.to_json)
	  puts value
	  
	  if value["Sector"].present?
	  	HoldingsCurrent.create(
		    ticker: value["Ticker"],
		    weight: value["Weight"],
			return: value["Return"],
			return_dollars: value["Return Dollars"],
			rank: value["Rank"],
			shares: value["Shares"],
			avg_share_cost: value["Avg Share Cost*"],
			current_price: value["Current Price"],
			value: value["Value"],
			days_held: value["Days Held"],
			strategy_name: strategy.strategy_name,
			sector: value["Sector"],
			strategy_id: strategy.id
	  	)
	  elsif value["return-link"].present?
	  	  HoldingsReturn.create(
	  	  	return_link: value["return-link"],
		    return_link_href: value["return-link-href"],
		    ticker: value["Ticker"],
		  	one_day: value["One Day"],
			last_close: value["Last Close"],
			change: value["Change"],
			weight_return: value["Weight Return"],
			one_week: value["One Week"],
			four_weeks: value["Four Weeks"],
			eight_weeks: value["Eight Weeks"],
			thirteen_weeks: value["13 Weeks"],
			strategy_name: strategy.strategy_name,
			strategy_id: strategy.id
		)
	  	elsif value["fundamental-link"].present?
	  	  HoldingsFundamental.create(
		  	fundamental_link: value["fundamental-link"],
			fundamental_link_href: value["fundamental-link-href"],
			ticker: value["Ticker"],
			return_fundamental: value["Return Fundamental"],
			market_cap: value["Market Cap"],
			yield: value["Yield"],
			p_e: value["P-E"],
			peg: value["PEG"],
			roe_ttm: value["ROE TTM"],
			roi_ttm: value["ROI TTM"],
			tot_debt_to_eq_ratio: value["Tot Debt to Eq Ratio"],
			pr2cfl_per_shr_ttm: value["Pr2CFl Per Shr TTM"],
			strategy_name: strategy.strategy_name,
			strategy_id: strategy.id
		  )
		elsif value["historical-link"].present?
	  	  HoldingsHistorical.create(
			historical_link: value["historical-link"],
			historical_link_href: value["historical-link-href"],
			ticker: value["Ticker"],
			cost: value["Cost"],
			open_date: value["Open Date"],
			number_of_days: value["Number of Days"],
			pct_historical: value["Pct Historical"],
			strategy_name: strategy.strategy_name,
			strategy_id: strategy.id
		  )
		# elsif value["summary-link"].present?
	 #  	  strategy = Strategy.create(
		#   	strategy_name: value["web-scraper-start-url"]
		#   )
		#   Strategy.create(
		#   	summary_link: value["summary-link"],
		# 	summary_link_href: value["summary-link-href"],
		# 	info_name: value["Info-Name"],
		# 	info_value: value["Info-Value"],
		# 	stats_name: value["Stats-Name"],
		# 	stats_value: value["Stats-Value"]
		#   )
		# elsif value["statistics-link"].present?
	 #  	  strategy = Strategy.create(
		#   	strategy_name: value["web-scraper-start-url"]
		#   )
		#   Strategy.create(
		# 	statistics_link: value["statistics-link"],
		# 	statistics_link_href: value["statistics-link-href"],
		# 	return_pct: value["Return (%)"],
		# 	model: value["Model"],
		# 	snp_500_spy: value["S&P 500 (SPY)"],
		# 	twenty_twenty_01: value["2020\/01"],
		# 	twenty_twenty_02: value["2020\/02"],
		# 	twenty_twenty_03: value["2020\/03"],
		# 	twenty_twenty_04: value["2020\/04"],
		# 	twenty_twenty_05: value["2020\/05"],
		# 	twenty_twenty_06: value["2020\/06"],
		# 	twenty_twenty_07: value["2020\/07"],
		# 	twenty_twenty_08: value["2020\/08"],
		# 	twenty_twenty_09: value["2020\/09"],
		# 	twenty_twenty_10: value["2020\/10"],
		# 	twenty_twenty_11: value["2020\/11"],
		# 	twenty_twenty_12: value["2020\/12"]
		#   )
		# elsif value["charts-link"].present?
	 #  	  strategy = Strategy.create(
		#   	strategy_name: value["web-scraper-start-url"]
		#   )
		#   Strategy.create(
		# 	charts_link: value["charts-link"],
		# 	charts_link_href: value["charts-link-href"]
		#   )
		# elsif value["trading-statistics-link"].present?
	 #  	  strategy = Strategy.create(
		#   	strategy_name: value["web-scraper-start-url"]
		#   )
		#   Strategy.create(
		# 	trading_statistics_link: value["trading-statistics-link"],
		# 	trading_statistics_link_href: value["trading-statistics-link-href"],
		# 	trading_values: value["Trading Values"],
		# 	trading_summary_names: value["Trading Summary Names"],
		# 	trading_names: value["Trading Names"],
		# 	realized_all: value["Realized All"],
		# 	realized_winners: value["Realized Winners"],
		# 	realized_losers: value["Realized Losers"],
		# 	unrealized_all: value["Unrealized All"],
		# 	unrealized_winners: value["Unrealized Winners"],
		# 	unrealized_losers: value["Unrealized Losers"]
		#   )
		# else value["risk-measurements-stats-link"].present?
	 #  	  strategy = Strategy.create(
		#   	strategy_name: value["web-scraper-start-url"]
		#   )
		#   Strategy.create(
		# 	risk_measurements_stats_link: value["risk-measurements-stats-link"],
		# 	risk_measurements_stats_link_href: value["risk-measurements-stats-link-href"],
		# 	risk_name: value["Risk Name"],
		# 	model_risk: value["Model Risk"],
		# 	snp_500_spy_risk: value["S&P 500 (SPY) Risk"]
		#   )
	 end
	 #  Strategy.create(
	 #  	web_scraper_order: value["web-scraper-order"],
	 #  	web_scraper_start_url: value["web-scraper-start-url"],
	 #    ticker: value["Ticker"],
	 #    weight: value["Weight"],
		# return: value["Return"],
		# return_dollars: value["Return Dollars"],
		# rank: value["Rank"],
		# shares: value["Shares"],
		# avg_share_cost: value["Avg Share Cost*"],
		# current_price: value["Current Price"],
		# value: value["Value"],
		# days_held: value["Days Held"],
		# sector: value["Sector"],
		# return_link: value["return-link"],
		# return_link_href: value["return-link-href"],
		# fundamental_link: value["fundamental-link"],
		# fundamental_link_href: value["fundamental_link_href"],
		# one_day: value["One Day"],
		# last_close: value["Last Close"],
		# change: value["Change"],
		# weight_return: value["Weight Return"],
		# one_week: value["One Week"],
		# four_weeks: value["Four Weeks"],
		# eight_weeks: value["Eight Weeks"],
		# thirteen_weeks: value["13 Weeks"],
		# return_fundamental: value["Return Fundamental"],
		# market_cap: value["Market Cap"],
		# yield: value["Yield"],
		# p_e: value["P-E"],
		# peg: value["PEG"],
		# roe_ttm: value["ROE TTM"],
		# roi_ttm: value["ROI TTM"],
		# tot_debt_to_eq_ratio: value["Tot Debt to Eq Ratio"],
		# pr2cfl_per_shr_ttm: value["Pr2CFl Per Shr TTM"],
		# historical_link: value["historical-link"],
		# historical_link_href: value["historical-link-href"],
		# cost: value["Cost"],
		# open_date: value["Open Date"],
		# number_of_days: value["Number of Days"],
		# pct_historical: value["Pct Historical"],
		# summary_link: value["summary-link"],
		# summary_link_href: value["summary-link-href"],
		# info_name: value["Info-Name"],
		# info_value: value["Info-Value"],
		# stats_name: value["Stats-Name"],
		# stats_value: value["Stats-value"],
		# statistics_link: value["statistics-link"],
		# statistics_link_href: value["statistics-link-href"],
		# return_pct: value["Return (%)"],
		# total: value["Total"],
		# model: value["Model"],
		# snp_500_spy: value["S&P 500 (SPY)"],
		# twenty_twenty_01: value["2020\/01"],
		# twenty_twenty_02: value["2020\/02"],
		# twenty_twenty_03: value["2020\/03"],
		# twenty_twenty_04: value["2020\/04"],
		# twenty_twenty_05: value["2020\/05"],
		# twenty_twenty_06: value["2020\/06"],
		# twenty_twenty_07: value["2020\/07"],
		# twenty_twenty_08: value["2020\/08"],
		# twenty_twenty_09: value["2020\/09"],
		# twenty_twenty_10: value["2020\/10"],
		# twenty_twenty_11: value["2020\/11"],
		# twenty_twenty_12: value["2020\/12"],
		# charts_link: value["charts-link"],
		# charts_link_href: value["charts-link-href"],
		# trading_statistics_link: value["trading-statistics-link"],
		# trading_statistics_link_href: value["trading-statistics-link-href"],
		# trading_values: value["Trading Values"],
		# trading_summary_names: value["Trading Summary Names"],
		# trading_names: value["Trading Names"],
		# realized_all: value["Realized All"],
		# realized_winners: value["Realized Winners"],
		# realized_losers: value["Realized Losers"],
		# unrealized_all: value["Unrealized All"],
		# unrealized_winners: value["Unrealized Winners"],
		# unrealized_losers: value["Unrealized Losers"],
		# risk_measurements_stats_link: value["risk-measurements-stats-link"],
		# risk_measurements_stats_link_href: value["risk-measurements-stats-link-href"],
		# risk_name: value["Risk Name"],
		# model_risk: value["Model Risk"],
		# snp_500_spy_risk: value["S&P 500 (SPY) Risk"]
	 #  )
	  	# }
	end
end
