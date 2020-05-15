class LiveStrategy < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  default_scope -> { order(created_at: :desc) }

  require 'active_support/all'
  require 'faraday'
  require 'json'

  def self.save_scrape
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
		type: value["Type"],
		rank_system: value["RankSystem"],
		inception: value["Inception"],
		update: value["Update"],
		rebal: value["Rebal"],
		holdings:value["Holdings"],
		annual: value["Annual"],
		sharpe_ratio: value["SharpeRatio"],
		d_down: value["DDown"],
	   )
	  end
	end
  end
end
