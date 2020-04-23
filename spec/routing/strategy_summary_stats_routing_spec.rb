require "rails_helper"

RSpec.describe StrategySummaryStatsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/strategy_summary_stats").to route_to("strategy_summary_stats#index")
    end

    it "routes to #show" do
      expect(:get => "/strategy_summary_stats/1").to route_to("strategy_summary_stats#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/strategy_summary_stats").to route_to("strategy_summary_stats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/strategy_summary_stats/1").to route_to("strategy_summary_stats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/strategy_summary_stats/1").to route_to("strategy_summary_stats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/strategy_summary_stats/1").to route_to("strategy_summary_stats#destroy", :id => "1")
    end
  end
end
