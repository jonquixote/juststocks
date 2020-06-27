class LiveStrategy < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  default_scope -> { order(created_at: :desc) }

  require 'active_support/all'
  require 'faraday'
  require 'json'

  def self.save_live_scrape
	webscraper_id = Webhook.first.scrapingjob_id.to_s
	webscraper_key = Rails.application.credentials.dig(:secret_key_webscraper)
	uri = URI('https://api.webscraper.io/api/v1/scraping-job/' + webscraper_id + '/json?api_token=V88D3jo2BzqkOqnOpRwKyRQQIWJ9yENpapKEWqh6Y5SISnTpKLtplCMWk5Mt')
	res = Net::HTTP.get_response(uri)
	response = res.body

	json = JSON.parse(response.to_json).each_line do |payload|
	  pload = JSON.parse(payload)
	  remove_nulls = pload.reject { |k, v| v == '' }
	  value = JSON.parse(remove_nulls.to_json)

	  if value["Inception"].present?
	   LiveStrategy.create(
		name: value["Name"],
		thype: value["Type"],
		rank_system: value["RankSystem"],
		inception: value["Inception"],
		upDate: value["Update"],
		rebal: value["Rebal"],
		holdings:value["Holdings"],
		annual: value["Annual"],
		sharpe_ratio: value["SharpeRatio"],
		d_down: value["DDown"]
	   )
	  elsif value["BenchYTD"].present?
	   LiveStrategiesPerformance.create(
	  	name: value["Name"],
		annual: value["Annual"],
		annualBench: value["AnnualBench"],
		ytd: value["YTD"],
		benchYtd: value["BenchYTD"],
		oneYear: value["1Year"],
		benchOneYear: value["Bench1Y"],
		totRet: value["TotRet"],
		benchRet: value["BenchRet"],
		oneDay: value["1Day"],
		oneWeek: value["1Wk"],
		fourWeeks: value["4Wk"],
		thirteenWeeks: value["13Wk"],
		twentySixWeeks: value["26Wk"]
	   )
	  elsif value["BenchmarkCorrel"].present?
	   LiveStrategiesStatistic.create(
	   	name: value["Name"],
		annual: value["Annual"],
		dDown: value["DDown"],
		stdDev: value["StdDev"],
		sharpeRatio: value["SharpeRatio"],
		sortinoRatio: value["SortinoRatio"],
		benchmarkCorrel: value["BenchmarkCorrel"],
		alpha: value["Alpha"],
		realizedWinners: value["RealizedWinners"],
		annualTurnover: value["AnnualTurnover"]
	   )
	  end
	end
  end
end
