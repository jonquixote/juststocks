require "rails_helper"

RSpec.describe WebHooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/web_hooks").to route_to("web_hooks#index")
    end

    it "routes to #show" do
      expect(:get => "/web_hooks/1").to route_to("web_hooks#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/web_hooks").to route_to("web_hooks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/web_hooks/1").to route_to("web_hooks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/web_hooks/1").to route_to("web_hooks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/web_hooks/1").to route_to("web_hooks#destroy", :id => "1")
    end
  end
end
