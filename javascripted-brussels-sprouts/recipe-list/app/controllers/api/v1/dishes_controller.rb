class Api::V1::DishesController < Api::V1::ApiController
  def index
    render json: Dish.all
  end
end
