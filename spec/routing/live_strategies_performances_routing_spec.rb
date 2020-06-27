require "rails_helper"

RSpec.describe LiveStrategiesPerformancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/live_strategies_performances").to route_to("live_strategies_performances#index")
    end

    it "routes to #show" do
      expect(:get => "/live_strategies_performances/1").to route_to("live_strategies_performances#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/live_strategies_performances").to route_to("live_strategies_performances#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/live_strategies_performances/1").to route_to("live_strategies_performances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/live_strategies_performances/1").to route_to("live_strategies_performances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/live_strategies_performances/1").to route_to("live_strategies_performances#destroy", :id => "1")
    end
  end
end
