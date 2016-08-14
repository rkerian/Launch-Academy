class API::FortunesController < ActionController::API
  def index
    @fortunes = Fortune.order(created_at: :desc).limit(10)
    render json: { fortunes: @fortunes }
  end

  def show
    @fortune = Fortune.find(params[:id])
    render json: { fortunes: @fortune }
  end

  def create
    @fortune = Fortune.new(fortune_params)

    if @fortune.save
      render json: { fortunes: @fortune },
        status: :created,
        location: api_fortune_url(@fortune)
    else
      render json: @fortune.errors,
        status: :unprocessable_entity
    end
  end

  def update
    @fortune = Fortune.find(params[:id])
    if @fortune.update(fortune_params)
      render json: { fortunes: @fortune }
    else
      render json: @fortune.errors,
        status: :unprocessable_entity
    end
  end

  def destroy
    @fortune = Fortune.find(params[:id])
    @fortune.destroy
  end

  private
  def fortune_params
    params.require(:fortune).permit(:content)
  end
end
