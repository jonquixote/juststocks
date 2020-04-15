require "rails_helper"

RSpec.describe HoldingsReturnsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/holdings_returns").to route_to("holdings_returns#index")
    end

    it "routes to #show" do
      expect(:get => "/holdings_returns/1").to route_to("holdings_returns#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/holdings_returns").to route_to("holdings_returns#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/holdings_returns/1").to route_to("holdings_returns#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/holdings_returns/1").to route_to("holdings_returns#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/holdings_returns/1").to route_to("holdings_returns#destroy", :id => "1")
    end
  end
end
