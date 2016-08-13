require "rails_helper"

describe Api::V1::DishesController do
  describe "#index" do
    let!(:first_dish) { create :dish, name: "The Bestest Dish" }
    let!(:other_dishes) { create_list :dish, 10 }

    before :each do
      get :index, { format: "json" }
    end

    it "returns a 200 status" do
      expect(response.status).to eq 200
    end

    it "returns a list of dishes" do
      expect(response.body).to include first_dish.to_json
      expect(response.body).to include other_dishes.last.to_json
    end
  end
end
