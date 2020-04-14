class Drink < ApplicationRecord
	# require 'active_support'
	require 'json'

	# get JSON
	# result = Net::HTTP.get(URI.parse('https://api.webscraper.io/api/v1/scraping-job/2052549?api_token=V88D3jo2BzqkOqnOpRwKyRQQIWJ9yENpapKEWqh6Y5SISnTpKLtplCMWk5Mt'))
	uri = URI('https://api.webscraper.io/api/v1/scraping-job/2052549?api_token=V88D3jo2BzqkOqnOpRwKyRQQIWJ9yENpapKEWqh6Y5SISnTpKLtplCMWk5Mt')
	res = Net::HTTP.get_response(uri)

	# deep merge
	# merge = result.inject(&:merge)
	# result.group_by { |h1| h1["employeeId"] }.map do |k,v|
	#   types = v.map { |h2| h2[:type] }  
	#   count = v.sum { |x| x['count'] } 

	#   { employeeId: k, 
	#     types: (types.length == 1 ? types[0] : 'both'), 
	#     count: count }
	# end  
	# # parse JSON
	response = res.body
	wrapper = Array.wrap(response)
	result = wrapper.to_json
	json = JSON.parse(result)

	# puts json

	# save data to DB
	# json[1..-1].each do |data| # [1..-1] ignores first dummy element
	#   Drink.create(
	#     product: data['product'],
	#     category: data['category'],
	#     rating: data['rating']
	#   )
	# end
end
