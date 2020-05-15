class Strategy < ApplicationRecord
	has_one :holdings_current, :class_name => "HoldingsCurrent"
	has_one :holdings_return, :class_name => "HoldingsReturn"
	has_one :holdings_fundamental, :class_name => "HoldingsFundamental"
	has_one :holdings_historical, :class_name => "HoldingsHistorical"
	has_one :strategy_summary, :class_name => "StrategySummary"
	has_one :strategy_summary_stat, :class_name => "StrategySummaryStat"
	has_one :strategy_trading_stat, :class_name => "StrategyTradingStat"
	has_one :stats_performance, :class_name => "StatsPerformance"
	has_one :risk_measurement, :class_name => "RiskMeasurement"
	default_scope -> { order(created_at: :desc) }

	require 'active_support/all'
	require 'faraday'
	require 'json'

  def self.save_scrape
	webscraper_id = Webhook.first.scrapingjob_id.to_s
	puts webscraper_id
	webscraper_key = Rails.application.credentials.dig(:secret_key_webscraper)
	uri = URI('https://api.webscraper.io/api/v1/scraping-job/' + webscraper_id + '/json?api_token=V88D3jo2BzqkOqnOpRwKyRQQIWJ9yENpapKEWqh6Y5SISnTpKLtplCMWk5Mt')
	res = Net::HTTP.get_response(uri)
	response = res.body
	puts uri

	wload = JSON.parse(response.to_json).each_line do |xload|
		yload = JSON.parse(xload)
		remove_nulls = yload.reject { |k, v| v == '' }
		if remove_nulls["strategy_name"].present?
			sload = remove_nulls["strategy_name"]
			@zetload = sload.to_s.gsub("Live Strategies\n\t\t\t\t\t\n\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t> Unclassified\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\n\t\t\t\t\n\t\t\t\t", "")	
		end
	end

	zload = JSON.parse(wload.lines.first)


	json = JSON.parse(response.to_json).each_line do |payload|
	pload = JSON.parse(payload)
	remove_nulls = pload.reject { |k, v| v == '' }
	value = JSON.parse(remove_nulls.to_json)
		
	if value["Sector"].present? || value["return-link"].present? || value["fundamental-link"].present? || value["historical-link"].present? || value["Info-Name"].present? || value["summary-link"].present? || value["statistics-link"].present? || value["trading-statistics-link"].present? || value["risk-measurements-stats-link"].present?
		strategy = Strategy.create(
		strategy_name: @zetload.lines.first,
		strategy_id: zload["web-scraper-start-url"].to_s.gsub("https:\/\/www.portfolio123.com\/holdings.jsp?portid=", ""),
		web_scraper_order: zload["web-scraper-order"],
		web_scraper_start_url: zload["web-scraper-start-url"].to_s.gsub("https:\/\/www.portfolio123.com\/holdings.jsp?portid=", "")
		)
	end

	if value["Sector"].present?
		HoldingsCurrent.create(
	    ticker: value["Ticker"].to_s.gsub(/3M1YTX3M1Y|3M1YMD3M1Y|3M1YHA3M1Y|3M1YMTH3M1Y|3M1YPM3M1Y|3M1YAYX3M1Y|3M1YBIIB3M1Y|3M1YCZZ3M1Y|3M1YIHRT3M1Y|3M1YLTM3M1Y|3M1YDECK3M1Y|3M1YC3M1Y|3M1YDISCA3M1Y|3M1YALK3M1Y|3M1YALL3M1Y|3M1YABBV3M1Y|3M1YBABA3M1Y|TRTN3M1YTRTN3M1Y|3M1YCHKP3M1Y|3M1YGWW3M1Y|3M1YMGA3M1Y|3M1YAXAHY3M1Y|3M1YLUV3M1Y|3M1YMHO3M1Y|3M1YDAN3M1Y|3M1YCMPR3M1Y|3M1YCMC3M1Y|3M1YTT3M1Y|3M1YDAL3M1Y|3M1YAMGN3M1Y|3M1YCR3M1Y|3M1YWBA3M1Y|3M1YX3M1Y|3M1YTSE3M1Y|3M1YSMG3M1Y|3M1YJBLU3M1Y|3M1YAAWW3M1Y|3M1YMPC3M1Y|3M1YLLY3M1Y|3M1YCIEN3M1Y|3M1YEBF3M1Y|3M1YEXEL3M1Y|3M1YAIR3M1Y|3M1YAIN3M1Y|3M1YARNA3M1Y|3M1YAIG3M1Y|3M1YATI3M1Y|3M1YAAPL3M1Y|3M1YPBF3M1Y|3M1YINTC3M1Y|3M1YCNX3M1Y|3M1YENTG3M1Y|3M1YLRCX3M1Y|3M1YJBT3M1Y|3M1YPRU3M1Y|3M1YJAZZ3M1Y|3M1YAAN3M1Y|3M1YXRX3M1Y|3M1YALG3M1Y|3M1YBRKB3M1Y|3M1YSWN3M1Y|3M1YALXN3M1Y|3M1YTPB3M1Y|3M1YCLS3M1Y|3M1YVRS3M1Y|3M1YTHG3M1Y|3M1YMIDD3M1Y|3M1YVEDL3M1Y|3M1YL3M1Y|3M1YTEX3M1Y|3M1YQRTEA3M1Y|3M1YEBAY3M1Y|3M1YCTXS3M1Y|3M1YDHT3M1Y|3M1YLNC3M1Y|3M1YLEN3M1Y|3M1YFB3M1Y|3M1YHSIC3M1Y|3M1YCI3M1Y|3M1YREZI3M1Y|3M1YFSS3M1Y|3M1YCCL3M1Y|3M1YSIRI3M1Y|3M1YMSM3M1Y|3M1YMET3M1Y|3M1YAZO3M1Y|3M1YIOSP3M1Y|3M1YCFG3M1Y|3M1YUAL3M1Y|3M1YCSCO3M1Y|3M1YCOG3M1Y|3M1YSNA3M1Y|3M1YGEF3M1Y|3M1YMFC3M1Y|3M1YBKNG3M1Y|3M1YGIII3M1Y|3M1YNTAP3M1Y|3M1YKELYA3M1Y|3M1YWGO3M1Y|3M1YPATK3M1Y|3M1YNFLX3M1Y|3M1YKFY3M1Y|3M1YAMAT3M1Y|3M1YBV3M1Y|3M1YCPRT3M1Y|3M1YVIAC3M1Y|3M1YROCK3M1Y|3M1YORCL3M1Y|3M1YHFC3M1Y|3M1YMKL3M1Y|3M1YIMO3M1Y|3M1YSAVE3M1Y|3M1YMT3M1Y|3M1YOSK3M1Y|3M1YANET3M1Y|3M1YJMHLY3M1Y|3M1YNSP3M1Y|3M1YAA3M1Y|3M1YMAS3M1Y|3M1YKFRC3M1Y|3M1YPFG3M1Y|3M1YVLO3M1Y|3M1YGBX3M1Y|Customize|3M1YKSS3M1Y|3M1YAA3M1Y|3M1YINN3M1Y|3M1YLSXMK3M1Y|3M1YMED3M1Y|3M1YFMX3M1Y|3M1YEBIX3M1Y|3M1YBIIB3M1Y|3M1YDISCA3M1Y|3M1YAIG3M1Y|3M1YPGR3M1Y|3M1YRIO3M1Y|3M1YUNM3M1Y|3M1YVALE3M1Y|3M1YANTM3M1Y|3M1YMDP3M1Y|3M1YLNC3M1Y|3M1YHCC3M1Y|3M1YBHP3M1Y|3M1YFAF3M1Y|3M1YVRS3M1Y|3M1YTECK3M1Y|3M1YMCY3M1Y|3M1YHBM3M1Y|3M1YAFL3M1Y|3M1YMSGN3M1Y|3M1YAMCX3M1Y|3M1YCPS3M1Y|3M1YAL3M1Y|3M1YHUM3M1Y|3M1YAMAT3M1Y|3M1YAMZN3M1Y|3M1YERF3M1Y|3M1YSPR3M1Y|3M1YMO3M1Y|3M1YPAM3M1Y|3M1YVEDL3M1Y|3M1YHLI3M1Y|3M1YJAZZ3M1Y|3M1YMAN3M1Y|3M1YSCCO3M1Y|3M1YVRS3M1Y|3M1YCOG3M1Y|3M1YRE3M1Y|3M1YJBLU3M1Y|3M1YMSGN3M1Y|3M1YVMW3M1Y|3M1YDISCA3M1Y|3M1YBK3M1Y|3M1YVALE3M1Y|3M1YMWA3M1Y|3M1YALSN3M1Y|3M1YQRTEA3M1Y|3M1YSTC3M1Y|3M1YDK3M1Y|3M1YPRU3M1Y|3M1YVGR3M1Y|3M1YCTRA3M1Y|3M1YAQN3M1Y|3M1YMSFT3M1Y|3M1YMCY3M1Y|3M1YVVV3M1Y|3M1YERI3M1Y|3M1YWBA3M1Y|3M1YCVE3M1Y|3M1YWLKP3M1Y|3M1YEBIX3M1Y|3M1YHCC3M1Y|3M1YBHP3M1Y|3M1YCHH3M1Y|3M1YMOH3M1Y|3M1YRS3M1Y|3M1YAFG3M1Y|3M1YXRX3M1Y|3M1YEC3M1Y|3M1YCEIX3M1Y|3M1YFAF3M1Y|3M1YINVA3M1Y|3M1YADBE3M1Y|3M1YGPRK3M1Y|3M1YKMPR3M1Y|3M1YLNC3M1Y|3M1YCRTO3M1Y|3M1YALL3M1Y|3M1YSUPN3M1Y|3M1YAMCX3M1Y|3M1YDGX3M1Y|3M1YCELH3M1Y|3M1YTTEC3M1Y|3M1YORI3M1Y|3M1YFIX3M1Y|3M1YINTC3M1Y|3M1YTROW3M1Y|3M1YMFC3M1Y|3M1YBHF3M1Y|3M1YHIG3M1Y|3M1YOZK3M1Y|3M1YIOSP3M1Y|3M1YNGHC3M1Y|3M1YLVS3M1Y|3M1YBLK3M1Y|3M1YACGL3M1Y|3M1YFMX3M1Y|3M1YHPQ3M1Y|3M1YCORT3M1Y|3M1YFSK3M1Y|3M1YBKNG3M1Y|3M1YX3M1Y|3M1YSYF3M1Y|3M1YIMAX3M1Y|3M1YVNDA3M1Y|3M1YFBHS3M1Y|3M1YCB3M1Y|3M1YSFNC3M1Y|3M1YNCMI3M1Y|3M1YTER3M1Y|3M1YMGM3M1Y|3M1YBTU3M1Y|3M1YINGR3M1Y|3M1YANTM3M1Y|3M1YAMGN3M1Y|3M1YAMP3M1Y|3M1YATH3M1Y|3M1YBPOP3M1Y|3M1YRF3M1Y|3M1YUFS3M1Y|3M1YEXPE3M1Y|3M1YEXEL3M1Y|3M1YALXN3M1Y|3M1YAVGO3M1Y|3M1YMET3M1Y|3M1YRIO3M1Y|3M1YKB3M1Y|3M1YSIGI3M1Y|3M1YAGO3M1Y|3M1YLSXMK3M1Y|3M1YCSL3M1Y|3M1YNUS3M1Y|3M1YPGR3M1Y|3M1YEIG3M1Y|3M1YLRCX3M1Y|3M1YAPAM3M1Y|3M1YCINF3M1Y|3M1YARCH3M1Y|3M1YJCOM3M1Y|3M1YFNF3M1Y|3M1YHI3M1Y|3M1YBLD3M1Y|3M1YSTZ3M1Y|3M1YKLAC3M1Y|3M1YJHG3M1Y|3M1YGL3M1Y|3M1YTPB3M1Y|3M1YAFL3M1Y|3M1YMED3M1Y|3M1YUNH3M1Y|3M1YSNX3M1Y|3M1YFHI3M1Y|3M1YNTDOY3M1Y|3M1YGRA3M1Y|3M1YUNM3M1Y|3M1YDFS3M1Y|3M1YOC3M1Y|3M1YHUM3M1Y|3M1YBYD3M1Y|3M1YCFG3M1Y|\s|\./, ""),
	    weight: value["Weight"],
		return: value["Return"],
		return_dollars: value["Return Dollars"],
		rank: value["Rank"],
		shares: value["Shares"],
		avg_share_cost: value["Avg Share Cost*"],
		current_price: value["Current Price"],
		value: value["Value"],
		days_held: value["Days Held"],
		sector: value["Sector"],
		strategy_name: strategy.strategy_name,
		strategy_id: strategy.id
		)
	elsif value["return-link"].present?
		  HoldingsReturn.create(
		  	return_link: value["return-link"],
	    return_link_href: value["return-link-href"],
	    ticker: value["Ticker"].to_s.gsub(/3M1YTX3M1Y|3M1YMD3M1Y|3M1YHA3M1Y|3M1YMTH3M1Y|3M1YPM3M1Y|3M1YAYX3M1Y|3M1YBIIB3M1Y|3M1YCZZ3M1Y|3M1YIHRT3M1Y|3M1YLTM3M1Y|3M1YDECK3M1Y|3M1YC3M1Y|3M1YDISCA3M1Y|3M1YALK3M1Y|3M1YALL3M1Y|3M1YABBV3M1Y|3M1YBABA3M1Y|TRTN3M1YTRTN3M1Y|3M1YCHKP3M1Y|3M1YGWW3M1Y|3M1YMGA3M1Y|3M1YAXAHY3M1Y|3M1YLUV3M1Y|3M1YMHO3M1Y|3M1YDAN3M1Y|3M1YCMPR3M1Y|3M1YCMC3M1Y|3M1YTT3M1Y|3M1YDAL3M1Y|3M1YAMGN3M1Y|3M1YCR3M1Y|3M1YWBA3M1Y|3M1YX3M1Y|3M1YTSE3M1Y|3M1YSMG3M1Y|3M1YJBLU3M1Y|3M1YAAWW3M1Y|3M1YMPC3M1Y|3M1YLLY3M1Y|3M1YCIEN3M1Y|3M1YEBF3M1Y|3M1YEXEL3M1Y|3M1YAIR3M1Y|3M1YAIN3M1Y|3M1YARNA3M1Y|3M1YAIG3M1Y|3M1YATI3M1Y|3M1YAAPL3M1Y|3M1YPBF3M1Y|3M1YINTC3M1Y|3M1YCNX3M1Y|3M1YENTG3M1Y|3M1YLRCX3M1Y|3M1YJBT3M1Y|3M1YPRU3M1Y|3M1YJAZZ3M1Y|3M1YAAN3M1Y|3M1YXRX3M1Y|3M1YALG3M1Y|3M1YBRKB3M1Y|3M1YSWN3M1Y|3M1YALXN3M1Y|3M1YTPB3M1Y|3M1YCLS3M1Y|3M1YVRS3M1Y|3M1YTHG3M1Y|3M1YMIDD3M1Y|3M1YVEDL3M1Y|3M1YL3M1Y|3M1YTEX3M1Y|3M1YQRTEA3M1Y|3M1YEBAY3M1Y|3M1YCTXS3M1Y|3M1YDHT3M1Y|3M1YLNC3M1Y|3M1YLEN3M1Y|3M1YFB3M1Y|3M1YHSIC3M1Y|3M1YCI3M1Y|3M1YREZI3M1Y|3M1YFSS3M1Y|3M1YCCL3M1Y|3M1YSIRI3M1Y|3M1YMSM3M1Y|3M1YMET3M1Y|3M1YAZO3M1Y|3M1YIOSP3M1Y|3M1YCFG3M1Y|3M1YUAL3M1Y|3M1YCSCO3M1Y|3M1YCOG3M1Y|3M1YSNA3M1Y|3M1YGEF3M1Y|3M1YMFC3M1Y|3M1YBKNG3M1Y|3M1YGIII3M1Y|3M1YNTAP3M1Y|3M1YKELYA3M1Y|3M1YWGO3M1Y|3M1YPATK3M1Y|3M1YNFLX3M1Y|3M1YKFY3M1Y|3M1YAMAT3M1Y|3M1YBV3M1Y|3M1YCPRT3M1Y|3M1YVIAC3M1Y|3M1YROCK3M1Y|3M1YORCL3M1Y|3M1YHFC3M1Y|3M1YMKL3M1Y|3M1YIMO3M1Y|3M1YSAVE3M1Y|3M1YMT3M1Y|3M1YOSK3M1Y|3M1YANET3M1Y|3M1YJMHLY3M1Y|3M1YNSP3M1Y|3M1YAA3M1Y|3M1YMAS3M1Y|3M1YKFRC3M1Y|3M1YPFG3M1Y|3M1YVLO3M1Y|3M1YGBX3M1Y|Customize|3M1YKSS3M1Y|3M1YAA3M1Y|3M1YINN3M1Y|3M1YLSXMK3M1Y|3M1YMED3M1Y|3M1YFMX3M1Y|3M1YEBIX3M1Y|3M1YBIIB3M1Y|3M1YDISCA3M1Y|3M1YAIG3M1Y|3M1YPGR3M1Y|3M1YRIO3M1Y|3M1YUNM3M1Y|3M1YVALE3M1Y|3M1YANTM3M1Y|3M1YMDP3M1Y|3M1YLNC3M1Y|3M1YHCC3M1Y|3M1YBHP3M1Y|3M1YFAF3M1Y|3M1YVRS3M1Y|3M1YTECK3M1Y|3M1YMCY3M1Y|3M1YHBM3M1Y|3M1YAFL3M1Y|3M1YMSGN3M1Y|3M1YAMCX3M1Y|3M1YCPS3M1Y|3M1YAL3M1Y|3M1YHUM3M1Y|3M1YAMAT3M1Y|3M1YAMZN3M1Y|3M1YERF3M1Y|3M1YSPR3M1Y|3M1YMO3M1Y|3M1YPAM3M1Y|3M1YVEDL3M1Y|3M1YHLI3M1Y|3M1YJAZZ3M1Y|3M1YMAN3M1Y|3M1YSCCO3M1Y|3M1YVRS3M1Y|3M1YCOG3M1Y|3M1YRE3M1Y|3M1YJBLU3M1Y|3M1YMSGN3M1Y|3M1YVMW3M1Y|3M1YDISCA3M1Y|3M1YBK3M1Y|3M1YVALE3M1Y|3M1YMWA3M1Y|3M1YALSN3M1Y|3M1YQRTEA3M1Y|3M1YSTC3M1Y|3M1YDK3M1Y|3M1YPRU3M1Y|3M1YVGR3M1Y|3M1YCTRA3M1Y|3M1YAQN3M1Y|3M1YMSFT3M1Y|3M1YMCY3M1Y|3M1YVVV3M1Y|3M1YERI3M1Y|3M1YWBA3M1Y|3M1YCVE3M1Y|3M1YWLKP3M1Y|3M1YEBIX3M1Y|3M1YHCC3M1Y|3M1YBHP3M1Y|3M1YCHH3M1Y|3M1YMOH3M1Y|3M1YRS3M1Y|3M1YAFG3M1Y|3M1YXRX3M1Y|3M1YEC3M1Y|3M1YCEIX3M1Y|3M1YFAF3M1Y|3M1YINVA3M1Y|3M1YADBE3M1Y|3M1YGPRK3M1Y|3M1YKMPR3M1Y|3M1YLNC3M1Y|3M1YCRTO3M1Y|3M1YALL3M1Y|3M1YSUPN3M1Y|3M1YAMCX3M1Y|3M1YDGX3M1Y|3M1YCELH3M1Y|3M1YTTEC3M1Y|3M1YORI3M1Y|3M1YFIX3M1Y|3M1YINTC3M1Y|3M1YTROW3M1Y|3M1YMFC3M1Y|3M1YBHF3M1Y|3M1YHIG3M1Y|3M1YOZK3M1Y|3M1YIOSP3M1Y|3M1YNGHC3M1Y|3M1YLVS3M1Y|3M1YBLK3M1Y|3M1YACGL3M1Y|3M1YFMX3M1Y|3M1YHPQ3M1Y|3M1YCORT3M1Y|3M1YFSK3M1Y|3M1YBKNG3M1Y|3M1YX3M1Y|3M1YSYF3M1Y|3M1YIMAX3M1Y|3M1YVNDA3M1Y|3M1YFBHS3M1Y|3M1YCB3M1Y|3M1YSFNC3M1Y|3M1YNCMI3M1Y|3M1YTER3M1Y|3M1YMGM3M1Y|3M1YBTU3M1Y|3M1YINGR3M1Y|3M1YANTM3M1Y|3M1YAMGN3M1Y|3M1YAMP3M1Y|3M1YATH3M1Y|3M1YBPOP3M1Y|3M1YRF3M1Y|3M1YUFS3M1Y|3M1YEXPE3M1Y|3M1YEXEL3M1Y|3M1YALXN3M1Y|3M1YAVGO3M1Y|3M1YMET3M1Y|3M1YRIO3M1Y|3M1YKB3M1Y|3M1YSIGI3M1Y|3M1YAGO3M1Y|3M1YLSXMK3M1Y|3M1YCSL3M1Y|3M1YNUS3M1Y|3M1YPGR3M1Y|3M1YEIG3M1Y|3M1YLRCX3M1Y|3M1YAPAM3M1Y|3M1YCINF3M1Y|3M1YARCH3M1Y|3M1YJCOM3M1Y|3M1YFNF3M1Y|3M1YHI3M1Y|3M1YBLD3M1Y|3M1YSTZ3M1Y|3M1YKLAC3M1Y|3M1YJHG3M1Y|3M1YGL3M1Y|3M1YTPB3M1Y|3M1YAFL3M1Y|3M1YMED3M1Y|3M1YUNH3M1Y|3M1YSNX3M1Y|3M1YFHI3M1Y|3M1YNTDOY3M1Y|3M1YGRA3M1Y|3M1YUNM3M1Y|3M1YDFS3M1Y|3M1YOC3M1Y|3M1YHUM3M1Y|3M1YBYD3M1Y|3M1YCFG3M1Y|\s|\./, ""),
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
		ticker: value["Ticker"].to_s.gsub(/3M1YTX3M1Y|3M1YMD3M1Y|3M1YHA3M1Y|3M1YMTH3M1Y|3M1YPM3M1Y|3M1YAYX3M1Y|3M1YBIIB3M1Y|3M1YCZZ3M1Y|3M1YIHRT3M1Y|3M1YLTM3M1Y|3M1YDECK3M1Y|3M1YC3M1Y|3M1YDISCA3M1Y|3M1YALK3M1Y|3M1YALL3M1Y|3M1YABBV3M1Y|3M1YBABA3M1Y|TRTN3M1YTRTN3M1Y|3M1YCHKP3M1Y|3M1YGWW3M1Y|3M1YMGA3M1Y|3M1YAXAHY3M1Y|3M1YLUV3M1Y|3M1YMHO3M1Y|3M1YDAN3M1Y|3M1YCMPR3M1Y|3M1YCMC3M1Y|3M1YTT3M1Y|3M1YDAL3M1Y|3M1YAMGN3M1Y|3M1YCR3M1Y|3M1YWBA3M1Y|3M1YX3M1Y|3M1YTSE3M1Y|3M1YSMG3M1Y|3M1YJBLU3M1Y|3M1YAAWW3M1Y|3M1YMPC3M1Y|3M1YLLY3M1Y|3M1YCIEN3M1Y|3M1YEBF3M1Y|3M1YEXEL3M1Y|3M1YAIR3M1Y|3M1YAIN3M1Y|3M1YARNA3M1Y|3M1YAIG3M1Y|3M1YATI3M1Y|3M1YAAPL3M1Y|3M1YPBF3M1Y|3M1YINTC3M1Y|3M1YCNX3M1Y|3M1YENTG3M1Y|3M1YLRCX3M1Y|3M1YJBT3M1Y|3M1YPRU3M1Y|3M1YJAZZ3M1Y|3M1YAAN3M1Y|3M1YXRX3M1Y|3M1YALG3M1Y|3M1YBRKB3M1Y|3M1YSWN3M1Y|3M1YALXN3M1Y|3M1YTPB3M1Y|3M1YCLS3M1Y|3M1YVRS3M1Y|3M1YTHG3M1Y|3M1YMIDD3M1Y|3M1YVEDL3M1Y|3M1YL3M1Y|3M1YTEX3M1Y|3M1YQRTEA3M1Y|3M1YEBAY3M1Y|3M1YCTXS3M1Y|3M1YDHT3M1Y|3M1YLNC3M1Y|3M1YLEN3M1Y|3M1YFB3M1Y|3M1YHSIC3M1Y|3M1YCI3M1Y|3M1YREZI3M1Y|3M1YFSS3M1Y|3M1YCCL3M1Y|3M1YSIRI3M1Y|3M1YMSM3M1Y|3M1YMET3M1Y|3M1YAZO3M1Y|3M1YIOSP3M1Y|3M1YCFG3M1Y|3M1YUAL3M1Y|3M1YCSCO3M1Y|3M1YCOG3M1Y|3M1YSNA3M1Y|3M1YGEF3M1Y|3M1YMFC3M1Y|3M1YBKNG3M1Y|3M1YGIII3M1Y|3M1YNTAP3M1Y|3M1YKELYA3M1Y|3M1YWGO3M1Y|3M1YPATK3M1Y|3M1YNFLX3M1Y|3M1YKFY3M1Y|3M1YAMAT3M1Y|3M1YBV3M1Y|3M1YCPRT3M1Y|3M1YVIAC3M1Y|3M1YROCK3M1Y|3M1YORCL3M1Y|3M1YHFC3M1Y|3M1YMKL3M1Y|3M1YIMO3M1Y|3M1YSAVE3M1Y|3M1YMT3M1Y|3M1YOSK3M1Y|3M1YANET3M1Y|3M1YJMHLY3M1Y|3M1YNSP3M1Y|3M1YAA3M1Y|3M1YMAS3M1Y|3M1YKFRC3M1Y|3M1YPFG3M1Y|3M1YVLO3M1Y|3M1YGBX3M1Y|Customize|3M1YKSS3M1Y|3M1YAA3M1Y|3M1YINN3M1Y|3M1YLSXMK3M1Y|3M1YMED3M1Y|3M1YFMX3M1Y|3M1YEBIX3M1Y|3M1YBIIB3M1Y|3M1YDISCA3M1Y|3M1YAIG3M1Y|3M1YPGR3M1Y|3M1YRIO3M1Y|3M1YUNM3M1Y|3M1YVALE3M1Y|3M1YANTM3M1Y|3M1YMDP3M1Y|3M1YLNC3M1Y|3M1YHCC3M1Y|3M1YBHP3M1Y|3M1YFAF3M1Y|3M1YVRS3M1Y|3M1YTECK3M1Y|3M1YMCY3M1Y|3M1YHBM3M1Y|3M1YAFL3M1Y|3M1YMSGN3M1Y|3M1YAMCX3M1Y|3M1YCPS3M1Y|3M1YAL3M1Y|3M1YHUM3M1Y|3M1YAMAT3M1Y|3M1YAMZN3M1Y|3M1YERF3M1Y|3M1YSPR3M1Y|3M1YMO3M1Y|3M1YPAM3M1Y|3M1YVEDL3M1Y|3M1YHLI3M1Y|3M1YJAZZ3M1Y|3M1YMAN3M1Y|3M1YSCCO3M1Y|3M1YVRS3M1Y|3M1YCOG3M1Y|3M1YRE3M1Y|3M1YJBLU3M1Y|3M1YMSGN3M1Y|3M1YVMW3M1Y|3M1YDISCA3M1Y|3M1YBK3M1Y|3M1YVALE3M1Y|3M1YMWA3M1Y|3M1YALSN3M1Y|3M1YQRTEA3M1Y|3M1YSTC3M1Y|3M1YDK3M1Y|3M1YPRU3M1Y|3M1YVGR3M1Y|3M1YCTRA3M1Y|3M1YAQN3M1Y|3M1YMSFT3M1Y|3M1YMCY3M1Y|3M1YVVV3M1Y|3M1YERI3M1Y|3M1YWBA3M1Y|3M1YCVE3M1Y|3M1YWLKP3M1Y|3M1YEBIX3M1Y|3M1YHCC3M1Y|3M1YBHP3M1Y|3M1YCHH3M1Y|3M1YMOH3M1Y|3M1YRS3M1Y|3M1YAFG3M1Y|3M1YXRX3M1Y|3M1YEC3M1Y|3M1YCEIX3M1Y|3M1YFAF3M1Y|3M1YINVA3M1Y|3M1YADBE3M1Y|3M1YGPRK3M1Y|3M1YKMPR3M1Y|3M1YLNC3M1Y|3M1YCRTO3M1Y|3M1YALL3M1Y|3M1YSUPN3M1Y|3M1YAMCX3M1Y|3M1YDGX3M1Y|3M1YCELH3M1Y|3M1YTTEC3M1Y|3M1YORI3M1Y|3M1YFIX3M1Y|3M1YINTC3M1Y|3M1YTROW3M1Y|3M1YMFC3M1Y|3M1YBHF3M1Y|3M1YHIG3M1Y|3M1YOZK3M1Y|3M1YIOSP3M1Y|3M1YNGHC3M1Y|3M1YLVS3M1Y|3M1YBLK3M1Y|3M1YACGL3M1Y|3M1YFMX3M1Y|3M1YHPQ3M1Y|3M1YCORT3M1Y|3M1YFSK3M1Y|3M1YBKNG3M1Y|3M1YX3M1Y|3M1YSYF3M1Y|3M1YIMAX3M1Y|3M1YVNDA3M1Y|3M1YFBHS3M1Y|3M1YCB3M1Y|3M1YSFNC3M1Y|3M1YNCMI3M1Y|3M1YTER3M1Y|3M1YMGM3M1Y|3M1YBTU3M1Y|3M1YINGR3M1Y|3M1YANTM3M1Y|3M1YAMGN3M1Y|3M1YAMP3M1Y|3M1YATH3M1Y|3M1YBPOP3M1Y|3M1YRF3M1Y|3M1YUFS3M1Y|3M1YEXPE3M1Y|3M1YEXEL3M1Y|3M1YALXN3M1Y|3M1YAVGO3M1Y|3M1YMET3M1Y|3M1YRIO3M1Y|3M1YKB3M1Y|3M1YSIGI3M1Y|3M1YAGO3M1Y|3M1YLSXMK3M1Y|3M1YCSL3M1Y|3M1YNUS3M1Y|3M1YPGR3M1Y|3M1YEIG3M1Y|3M1YLRCX3M1Y|3M1YAPAM3M1Y|3M1YCINF3M1Y|3M1YARCH3M1Y|3M1YJCOM3M1Y|3M1YFNF3M1Y|3M1YHI3M1Y|3M1YBLD3M1Y|3M1YSTZ3M1Y|3M1YKLAC3M1Y|3M1YJHG3M1Y|3M1YGL3M1Y|3M1YTPB3M1Y|3M1YAFL3M1Y|3M1YMED3M1Y|3M1YUNH3M1Y|3M1YSNX3M1Y|3M1YFHI3M1Y|3M1YNTDOY3M1Y|3M1YGRA3M1Y|3M1YUNM3M1Y|3M1YDFS3M1Y|3M1YOC3M1Y|3M1YHUM3M1Y|3M1YBYD3M1Y|3M1YCFG3M1Y|\s|\./, ""),
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
		ticker: value["Ticker"].to_s.gsub(/3M1YTX3M1Y|3M1YMD3M1Y|3M1YHA3M1Y|3M1YMTH3M1Y|3M1YPM3M1Y|3M1YAYX3M1Y|3M1YBIIB3M1Y|3M1YCZZ3M1Y|3M1YIHRT3M1Y|3M1YLTM3M1Y|3M1YDECK3M1Y|3M1YC3M1Y|3M1YDISCA3M1Y|3M1YALK3M1Y|3M1YALL3M1Y|3M1YABBV3M1Y|3M1YBABA3M1Y|TRTN3M1YTRTN3M1Y|3M1YCHKP3M1Y|3M1YGWW3M1Y|3M1YMGA3M1Y|3M1YAXAHY3M1Y|3M1YLUV3M1Y|3M1YMHO3M1Y|3M1YDAN3M1Y|3M1YCMPR3M1Y|3M1YCMC3M1Y|3M1YTT3M1Y|3M1YDAL3M1Y|3M1YAMGN3M1Y|3M1YCR3M1Y|3M1YWBA3M1Y|3M1YX3M1Y|3M1YTSE3M1Y|3M1YSMG3M1Y|3M1YJBLU3M1Y|3M1YAAWW3M1Y|3M1YMPC3M1Y|3M1YLLY3M1Y|3M1YCIEN3M1Y|3M1YEBF3M1Y|3M1YEXEL3M1Y|3M1YAIR3M1Y|3M1YAIN3M1Y|3M1YARNA3M1Y|3M1YAIG3M1Y|3M1YATI3M1Y|3M1YAAPL3M1Y|3M1YPBF3M1Y|3M1YINTC3M1Y|3M1YCNX3M1Y|3M1YENTG3M1Y|3M1YLRCX3M1Y|3M1YJBT3M1Y|3M1YPRU3M1Y|3M1YJAZZ3M1Y|3M1YAAN3M1Y|3M1YXRX3M1Y|3M1YALG3M1Y|3M1YBRKB3M1Y|3M1YSWN3M1Y|3M1YALXN3M1Y|3M1YTPB3M1Y|3M1YCLS3M1Y|3M1YVRS3M1Y|3M1YTHG3M1Y|3M1YMIDD3M1Y|3M1YVEDL3M1Y|3M1YL3M1Y|3M1YTEX3M1Y|3M1YQRTEA3M1Y|3M1YEBAY3M1Y|3M1YCTXS3M1Y|3M1YDHT3M1Y|3M1YLNC3M1Y|3M1YLEN3M1Y|3M1YFB3M1Y|3M1YHSIC3M1Y|3M1YCI3M1Y|3M1YREZI3M1Y|3M1YFSS3M1Y|3M1YCCL3M1Y|3M1YSIRI3M1Y|3M1YMSM3M1Y|3M1YMET3M1Y|3M1YAZO3M1Y|3M1YIOSP3M1Y|3M1YCFG3M1Y|3M1YUAL3M1Y|3M1YCSCO3M1Y|3M1YCOG3M1Y|3M1YSNA3M1Y|3M1YGEF3M1Y|3M1YMFC3M1Y|3M1YBKNG3M1Y|3M1YGIII3M1Y|3M1YNTAP3M1Y|3M1YKELYA3M1Y|3M1YWGO3M1Y|3M1YPATK3M1Y|3M1YNFLX3M1Y|3M1YKFY3M1Y|3M1YAMAT3M1Y|3M1YBV3M1Y|3M1YCPRT3M1Y|3M1YVIAC3M1Y|3M1YROCK3M1Y|3M1YORCL3M1Y|3M1YHFC3M1Y|3M1YMKL3M1Y|3M1YIMO3M1Y|3M1YSAVE3M1Y|3M1YMT3M1Y|3M1YOSK3M1Y|3M1YANET3M1Y|3M1YJMHLY3M1Y|3M1YNSP3M1Y|3M1YAA3M1Y|3M1YMAS3M1Y|3M1YKFRC3M1Y|3M1YPFG3M1Y|3M1YVLO3M1Y|3M1YGBX3M1Y|Customize|3M1YKSS3M1Y|3M1YAA3M1Y|3M1YINN3M1Y|3M1YLSXMK3M1Y|3M1YMED3M1Y|3M1YFMX3M1Y|3M1YEBIX3M1Y|3M1YBIIB3M1Y|3M1YDISCA3M1Y|3M1YAIG3M1Y|3M1YPGR3M1Y|3M1YRIO3M1Y|3M1YUNM3M1Y|3M1YVALE3M1Y|3M1YANTM3M1Y|3M1YMDP3M1Y|3M1YLNC3M1Y|3M1YHCC3M1Y|3M1YBHP3M1Y|3M1YFAF3M1Y|3M1YVRS3M1Y|3M1YTECK3M1Y|3M1YMCY3M1Y|3M1YHBM3M1Y|3M1YAFL3M1Y|3M1YMSGN3M1Y|3M1YAMCX3M1Y|3M1YCPS3M1Y|3M1YAL3M1Y|3M1YHUM3M1Y|3M1YAMAT3M1Y|3M1YAMZN3M1Y|3M1YERF3M1Y|3M1YSPR3M1Y|3M1YMO3M1Y|3M1YPAM3M1Y|3M1YVEDL3M1Y|3M1YHLI3M1Y|3M1YJAZZ3M1Y|3M1YMAN3M1Y|3M1YSCCO3M1Y|3M1YVRS3M1Y|3M1YCOG3M1Y|3M1YRE3M1Y|3M1YJBLU3M1Y|3M1YMSGN3M1Y|3M1YVMW3M1Y|3M1YDISCA3M1Y|3M1YBK3M1Y|3M1YVALE3M1Y|3M1YMWA3M1Y|3M1YALSN3M1Y|3M1YQRTEA3M1Y|3M1YSTC3M1Y|3M1YDK3M1Y|3M1YPRU3M1Y|3M1YVGR3M1Y|3M1YCTRA3M1Y|3M1YAQN3M1Y|3M1YMSFT3M1Y|3M1YMCY3M1Y|3M1YVVV3M1Y|3M1YERI3M1Y|3M1YWBA3M1Y|3M1YCVE3M1Y|3M1YWLKP3M1Y|3M1YEBIX3M1Y|3M1YHCC3M1Y|3M1YBHP3M1Y|3M1YCHH3M1Y|3M1YMOH3M1Y|3M1YRS3M1Y|3M1YAFG3M1Y|3M1YXRX3M1Y|3M1YEC3M1Y|3M1YCEIX3M1Y|3M1YFAF3M1Y|3M1YINVA3M1Y|3M1YADBE3M1Y|3M1YGPRK3M1Y|3M1YKMPR3M1Y|3M1YLNC3M1Y|3M1YCRTO3M1Y|3M1YALL3M1Y|3M1YSUPN3M1Y|3M1YAMCX3M1Y|3M1YDGX3M1Y|3M1YCELH3M1Y|3M1YTTEC3M1Y|3M1YORI3M1Y|3M1YFIX3M1Y|3M1YINTC3M1Y|3M1YTROW3M1Y|3M1YMFC3M1Y|3M1YBHF3M1Y|3M1YHIG3M1Y|3M1YOZK3M1Y|3M1YIOSP3M1Y|3M1YNGHC3M1Y|3M1YLVS3M1Y|3M1YBLK3M1Y|3M1YACGL3M1Y|3M1YFMX3M1Y|3M1YHPQ3M1Y|3M1YCORT3M1Y|3M1YFSK3M1Y|3M1YBKNG3M1Y|3M1YX3M1Y|3M1YSYF3M1Y|3M1YIMAX3M1Y|3M1YVNDA3M1Y|3M1YFBHS3M1Y|3M1YCB3M1Y|3M1YSFNC3M1Y|3M1YNCMI3M1Y|3M1YTER3M1Y|3M1YMGM3M1Y|3M1YBTU3M1Y|3M1YINGR3M1Y|3M1YANTM3M1Y|3M1YAMGN3M1Y|3M1YAMP3M1Y|3M1YATH3M1Y|3M1YBPOP3M1Y|3M1YRF3M1Y|3M1YUFS3M1Y|3M1YEXPE3M1Y|3M1YEXEL3M1Y|3M1YALXN3M1Y|3M1YAVGO3M1Y|3M1YMET3M1Y|3M1YRIO3M1Y|3M1YKB3M1Y|3M1YSIGI3M1Y|3M1YAGO3M1Y|3M1YLSXMK3M1Y|3M1YCSL3M1Y|3M1YNUS3M1Y|3M1YPGR3M1Y|3M1YEIG3M1Y|3M1YLRCX3M1Y|3M1YAPAM3M1Y|3M1YCINF3M1Y|3M1YARCH3M1Y|3M1YJCOM3M1Y|3M1YFNF3M1Y|3M1YHI3M1Y|3M1YBLD3M1Y|3M1YSTZ3M1Y|3M1YKLAC3M1Y|3M1YJHG3M1Y|3M1YGL3M1Y|3M1YTPB3M1Y|3M1YAFL3M1Y|3M1YMED3M1Y|3M1YUNH3M1Y|3M1YSNX3M1Y|3M1YFHI3M1Y|3M1YNTDOY3M1Y|3M1YGRA3M1Y|3M1YUNM3M1Y|3M1YDFS3M1Y|3M1YOC3M1Y|3M1YHUM3M1Y|3M1YBYD3M1Y|3M1YCFG3M1Y|\s|\./, ""),
		cost: value["Cost"],
		open_date: value["Open Date"],
		number_of_days: value["Number of Days"],
		pct_historical: value["Pct Historical"],
		strategy_name: strategy.strategy_name,
		strategy_id: strategy.id
	  )
	elsif value["Info-Name"].present?
	    StrategySummary.create(
	  	summary_link: value["summary-link"],
		summary_link_href: value["summary-link-href"],
		info_name: value["Info-Name"],
		info_value: value["Info-Value"],
		strategy_name: strategy.strategy_name,
		strategy_id: strategy.id
	  )
	elsif value["summary-link"].present?
	    StrategySummaryStat.create(
	  	summary_link: value["summary-link"],
		summary_link_href: value["summary-link-href"],
		stats_name: value["Stats-Name"],
		stats_value: value["Stats-Value"],
		strategy_name: strategy.strategy_name,
		strategy_id: strategy.id
	  )
	elsif value["statistics-link"].present?
	  StatsPerformance.create(
		statistics_link: value["statistics-link"],
		statistics_link_href: value["statistics-link-href"],
		return_pct: value["Return (%)"],
		model: value["Model"],
		snp_500_spy: value["S&P 500 (SPY)"],
		twenty_twenty_01: value["2020\/01"],
		twenty_twenty_02: value["2020\/02"],
		twenty_twenty_03: value["2020\/03"],
		twenty_twenty_04: value["2020\/04"],
		twenty_twenty_05: value["2020\/05"],
		twenty_twenty_06: value["2020\/06"],
		twenty_twenty_07: value["2020\/07"],
		twenty_twenty_08: value["2020\/08"],
		twenty_twenty_09: value["2020\/09"],
		twenty_twenty_10: value["2020\/10"],
		twenty_twenty_11: value["2020\/11"],
		twenty_twenty_12: value["2020\/12"],
		strategy_name: strategy.strategy_name,
		strategy_id: strategy.id
	  )
	elsif value["trading-statistics-link"].present?
	  StrategyTradingStat.create(
		trading_statistics_link: value["trading-statistics-link"],
		trading_statistics_link_href: value["trading-statistics-link-href"],
		trading_values: value["Trading Values"],
		trading_summary_names: value["Trading Summary Names"],
		trading_names: value["Trading Names"],
		realized_all: value["Realized All"],
		realized_winners: value["Realized Winners"],
		realized_losers: value["Realized Losers"],
		unrealized_all: value["Unrealized All"],
		unrealized_winners: value["Unrealized Winners"],
		unrealized_losers: value["Unrealized Losers"],
		strategy_name: strategy.strategy_name,
		strategy_id: strategy.id
	  )
	else value["risk-measurements-stats-link"].present?
	  RiskMeasurement.create(
		risk_measurements_stats_link: value["risk-measurements-stats-link"],
		risk_measurements_stats_link_href: value["risk-measurements-stats-link-href"],
		risk_name: value["Risk Name"],
		model_risk: value["Model Risk"],
		snp_500_spy_risk: value["S&P 500 (SPY) Risk"],
		strategy_name: strategy.strategy_name,
		strategy_id: strategy.id
	  )
	end
   end
  end
end
