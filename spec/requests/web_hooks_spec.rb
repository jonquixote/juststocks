require 'rails_helper'

RSpec.describe "WebHooks", type: :request do
  describe "GET /web_hooks" do
    it "works! (now write some real specs)" do
      get web_hooks_path
      expect(response).to have_http_status(200)
    end
  end
end
