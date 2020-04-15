require "rails_helper"

RSpec.describe HoldingsCurrentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/holdings_currents").to route_to("holdings_currents#index")
    end

    it "routes to #show" do
      expect(:get => "/holdings_currents/1").to route_to("holdings_currents#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/holdings_currents").to route_to("holdings_currents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/holdings_currents/1").to route_to("holdings_currents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/holdings_currents/1").to route_to("holdings_currents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/holdings_currents/1").to route_to("holdings_currents#destroy", :id => "1")
    end
  end
end
