require 'rails_helper'

RSpec.describe "LiveStrategiesPerformances", type: :request do
  describe "GET /live_strategies_performances" do
    it "works! (now write some real specs)" do
      get live_strategies_performances_path
      expect(response).to have_http_status(200)
    end
  end
end
