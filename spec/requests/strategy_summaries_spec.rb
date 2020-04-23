require 'rails_helper'

RSpec.describe "StrategySummaries", type: :request do
  describe "GET /strategy_summaries" do
    it "works! (now write some real specs)" do
      get strategy_summaries_path
      expect(response).to have_http_status(200)
    end
  end
end
