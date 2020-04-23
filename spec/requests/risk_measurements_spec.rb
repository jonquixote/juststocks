require 'rails_helper'

RSpec.describe "RiskMeasurements", type: :request do
  describe "GET /risk_measurements" do
    it "works! (now write some real specs)" do
      get risk_measurements_path
      expect(response).to have_http_status(200)
    end
  end
end
