require "rails_helper"

RSpec.describe LiveStrategiesStatisticsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/live_strategies_statistics").to route_to("live_strategies_statistics#index")
    end

    it "routes to #show" do
      expect(:get => "/live_strategies_statistics/1").to route_to("live_strategies_statistics#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/live_strategies_statistics").to route_to("live_strategies_statistics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/live_strategies_statistics/1").to route_to("live_strategies_statistics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/live_strategies_statistics/1").to route_to("live_strategies_statistics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/live_strategies_statistics/1").to route_to("live_strategies_statistics#destroy", :id => "1")
    end
  end
end
