class PositionsController < ApplicationController
  def index
    UseCase::GetPositions.new.get
  end
end
