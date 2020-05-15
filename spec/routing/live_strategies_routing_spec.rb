require "rails_helper"

RSpec.describe LiveStrategiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/live_strategies").to route_to("live_strategies#index")
    end

    it "routes to #show" do
      expect(:get => "/live_strategies/1").to route_to("live_strategies#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/live_strategies").to route_to("live_strategies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/live_strategies/1").to route_to("live_strategies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/live_strategies/1").to route_to("live_strategies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/live_strategies/1").to route_to("live_strategies#destroy", :id => "1")
    end
  end
end
