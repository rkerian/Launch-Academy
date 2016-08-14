require "rails_helper"

RSpec.describe API::FortunesController, type: :controller do
  describe "GET /api/fortunes" do
    it "returns an index of ten fortunes" do
      create_list(:fortune, 12)
      get :index
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["fortunes"].count).to eq(10)
    end
  end
end
