require 'rails_helper'

RSpec.describe "HoldingsHistoricals", type: :request do
  describe "GET /holdings_historicals" do
    it "works! (now write some real specs)" do
      get holdings_historicals_path
      expect(response).to have_http_status(200)
    end
  end
end
