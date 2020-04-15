require 'rails_helper'

RSpec.describe "HoldingsReturns", type: :request do
  describe "GET /holdings_returns" do
    it "works! (now write some real specs)" do
      get holdings_returns_path
      expect(response).to have_http_status(200)
    end
  end
end
