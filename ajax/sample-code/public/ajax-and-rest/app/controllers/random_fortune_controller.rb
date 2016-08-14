class RandomFortuneController < ApplicationController
  def index
    @fortune = Fortune.all.sample
  end
end
