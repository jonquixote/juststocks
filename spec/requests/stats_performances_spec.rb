require 'rails_helper'

RSpec.describe "StatsPerformances", type: :request do
  describe "GET /stats_performances" do
    it "works! (now write some real specs)" do
      get stats_performances_path
      expect(response).to have_http_status(200)
    end
  end
end
