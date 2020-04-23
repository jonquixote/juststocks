require "rails_helper"

RSpec.describe RiskMeasurementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/risk_measurements").to route_to("risk_measurements#index")
    end

    it "routes to #show" do
      expect(:get => "/risk_measurements/1").to route_to("risk_measurements#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/risk_measurements").to route_to("risk_measurements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/risk_measurements/1").to route_to("risk_measurements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/risk_measurements/1").to route_to("risk_measurements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/risk_measurements/1").to route_to("risk_measurements#destroy", :id => "1")
    end
  end
end
