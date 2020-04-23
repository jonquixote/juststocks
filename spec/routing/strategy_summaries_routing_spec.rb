require "rails_helper"

RSpec.describe StrategySummariesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/strategy_summaries").to route_to("strategy_summaries#index")
    end

    it "routes to #show" do
      expect(:get => "/strategy_summaries/1").to route_to("strategy_summaries#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/strategy_summaries").to route_to("strategy_summaries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/strategy_summaries/1").to route_to("strategy_summaries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/strategy_summaries/1").to route_to("strategy_summaries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/strategy_summaries/1").to route_to("strategy_summaries#destroy", :id => "1")
    end
  end
end
