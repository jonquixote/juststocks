require "rails_helper"

RSpec.describe HoldingsHistoricalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/holdings_historicals").to route_to("holdings_historicals#index")
    end

    it "routes to #show" do
      expect(:get => "/holdings_historicals/1").to route_to("holdings_historicals#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/holdings_historicals").to route_to("holdings_historicals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/holdings_historicals/1").to route_to("holdings_historicals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/holdings_historicals/1").to route_to("holdings_historicals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/holdings_historicals/1").to route_to("holdings_historicals#destroy", :id => "1")
    end
  end
end
