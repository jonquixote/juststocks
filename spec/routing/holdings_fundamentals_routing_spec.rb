require "rails_helper"

RSpec.describe HoldingsFundamentalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/holdings_fundamentals").to route_to("holdings_fundamentals#index")
    end

    it "routes to #show" do
      expect(:get => "/holdings_fundamentals/1").to route_to("holdings_fundamentals#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/holdings_fundamentals").to route_to("holdings_fundamentals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/holdings_fundamentals/1").to route_to("holdings_fundamentals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/holdings_fundamentals/1").to route_to("holdings_fundamentals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/holdings_fundamentals/1").to route_to("holdings_fundamentals#destroy", :id => "1")
    end
  end
end
