require 'rails_helper'

RSpec.describe "StrategySummaryStats", type: :request do
  describe "GET /strategy_summary_stats" do
    it "works! (now write some real specs)" do
      get strategy_summary_stats_path
      expect(response).to have_http_status(200)
    end
  end
end
