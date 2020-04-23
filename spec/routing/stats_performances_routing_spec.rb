require "rails_helper"

RSpec.describe StatsPerformancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/stats_performances").to route_to("stats_performances#index")
    end

    it "routes to #show" do
      expect(:get => "/stats_performances/1").to route_to("stats_performances#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/stats_performances").to route_to("stats_performances#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/stats_performances/1").to route_to("stats_performances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/stats_performances/1").to route_to("stats_performances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stats_performances/1").to route_to("stats_performances#destroy", :id => "1")
    end
  end
end
