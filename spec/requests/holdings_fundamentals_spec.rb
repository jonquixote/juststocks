require 'rails_helper'

RSpec.describe "HoldingsFundamentals", type: :request do
  describe "GET /holdings_fundamentals" do
    it "works! (now write some real specs)" do
      get holdings_fundamentals_path
      expect(response).to have_http_status(200)
    end
  end
end
