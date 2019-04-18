require 'rails_helper'

RSpec.describe "Couples", type: :request do
  describe "GET /couples" do
    it "works! (now write some real specs)" do
      get couples_path
      expect(response).to have_http_status(200)
    end
  end
end
