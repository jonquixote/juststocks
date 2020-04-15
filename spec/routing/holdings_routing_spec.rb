require "rails_helper"

RSpec.describe HoldingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/holdings").to route_to("holdings#index")
    end

    it "routes to #show" do
      expect(:get => "/holdings/1").to route_to("holdings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/holdings").to route_to("holdings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/holdings/1").to route_to("holdings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/holdings/1").to route_to("holdings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/holdings/1").to route_to("holdings#destroy", :id => "1")
    end
  end
end
