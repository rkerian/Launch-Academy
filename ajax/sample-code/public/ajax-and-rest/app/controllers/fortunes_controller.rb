class FortunesController < ApplicationController
  def index
    @fortunes = Fortune.order(created_at: :desc).limit(10)
  end

  def create
    @fortune = Fortune.new(fortune_params)
    if @fortune.save
      flash[:success] = "Fortune created!"
      redirect_to fortunes_path
    else
      @fortunes = Fortune.order(created_at: :desc).limit(10)
      flash[:alert] = @fortune.errors.full_messages.join(". ")
      render :index
    end
  end

  private
  def fortune_params
    params.require(:fortune).permit(:content)
  end
end
