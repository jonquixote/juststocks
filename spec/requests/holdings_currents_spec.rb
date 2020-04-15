require 'rails_helper'

RSpec.describe "HoldingsCurrents", type: :request do
  describe "GET /holdings_currents" do
    it "works! (now write some real specs)" do
      get holdings_currents_path
      expect(response).to have_http_status(200)
    end
  end
end
